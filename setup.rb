ActiveRecord::Migration.verbose = false

CONNECT = lambda do
  ActiveRecord::Base.establish_connection(
    database: 'csv_import',
    adapter: 'postgresql'
  )
end.tap(&:call)

# Generate a CSV file
CSV.open(DATA_FILE, 'wb') do |csv|
  csv << COLUMNS
  COUNT.times { csv << VALUES }
end

module ReportFiltering
  def report(msg, *args)
    filter = ENV['FILTER']
    return if filter && msg !~ /#{filter}/i
    super(msg, *args)
  end
end

# Create schema, drop if exists
module DatabaseSetup
  def report(*)
    ActiveRecord::Schema.define do
      create_table :models, force: true do |t|
        COLUMNS.each do |column|
          t.string(column)
        end
      end
    end

    CONNECT.call
    super
  end
end

module ReportWithPadding
  def report(msg, *args)
    super(msg.ljust(80), *args)
  end
end