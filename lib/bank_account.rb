class BankAccount
  
  attr_accessor :balance, :status
  attr_reader :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    save
  end
  
  def deposit(deposit_amount)
    @balance += deposit_amount
  end
  
  def display_balance
    "Your balance is $#{@balance}."
  end
  
  def valid?
    (@balance > 0 && @status.downcase == "open") ? true : false
  end
  
  def close_account
    @status = "closed"
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.find_account_by_name(name)
    self.all.find { |account| account.name == name }
  end
  
end


=begin

  describe '#deposit' do
    it "can deposit money into its account" do
      expect(avi.balance).to eq(1000)
      avi.deposit(1000)
      expect(avi.balance).to eq(2000)
    end
  end

  describe '#valid?' do
    it "is valid with an open status and a balance greater than 0" do
      @broke = BankAccount.new("Kat Dennings")
      @broke.balance = 0
      @closed = BankAccount.new("Beth Behrs")
      @closed.status = "closed"
      expect(avi.valid?).to eq(true)
      expect(@broke.valid?).to eq(false)
      expect(@closed.valid?).to eq(false)
    end
  end

  describe '#close_account' do
    it "can close its account" do
      avi.close_account
      expect(avi.status).to eq("closed")
    end
  end
end


=end