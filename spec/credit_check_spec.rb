require 'credit_check'

describe CreditCheck do
  let(:credit_check) { CreditCheck.new(number) }

  describe "with the given sample" do
    let(:number) { "79927398713" }
    specify { expect(credit_check.account).to eq [7,9,9,2,7,3,9,8,7,1,3] }
    specify { expect(credit_check.check_digit).to eq 3 }
    specify { expect(credit_check.double_every_other_digit).to eq [7,18,9,4,7,6,9,16,7,2,3] }
    specify { expect(credit_check.sum_digits_over_10).to eq [7,9,9,4,7,6,9,7,7,2,3] }
    specify { expect(credit_check.sum_results).to eq 70 }
    specify { expect(credit_check).to be_valid }
  end

  describe "with valid account numbers" do
    valid_numbers = ["5541808923795240", "4024007136512380", "6011797668867828"]

    valid_numbers.each do |valid_number|
      let(:number) { valid_number}
      specify { expect(credit_check).to be_valid }
    end
  end

  describe "with invalid account numbers" do
    invalid_numbers = ["5541801923795240", "4024007106512380", "6011797668868728"]

    invalid_numbers.each do |invalid_number|
      let(:number) { invalid_number }
      specify { expect(credit_check).not_to be_valid }
    end
  end

  describe "with a valid American Express number" do
    let(:number) { "342804633855673" }
    specify { expect(credit_check).to be_valid }
  end

  describe "with an invalid American Express number" do
    let(:number) { "342801633855673" }
    specify { expect(credit_check).not_to be_valid }
  end
end
