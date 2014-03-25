class Payment < ActiveRecord::Base
	attr_accessor :card_number

	belongs_to :user
	belongs_to :lease
	# has_many :payment_transactions
	has_many :transactions, :class_name => :PaymentTransaction

	validates :amount, presence: true, numericality: true
	validates :first_name, :last_name, :card_number, presence: true

	validate :validate_card, :on => :create

	def make_transaction
		response = GATEWAY.purchase((amount*100), credit_card)
		transactions.create(:response => response, :payment => self)
		response.success?
	end

	private

	def credit_card
		@credit_card = ActiveMerchant::Billing::CreditCard.new({
			:first_name => first_name,
			:last_name => last_name,
			:number => card_number,
			:month => card_expires_on.month,
			:year => card_expires_on.year,
			:verification_value => '999'
			})
	end

	def validate_card
		unless credit_card.valid?
			credit_card.errors.full_messages.each do |message|
				error.add_to_base_message
			end
		end
	end

end
