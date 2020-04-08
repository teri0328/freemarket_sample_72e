require 'rails_helper'
describe User do
  describe '#create' do

    it "nicknameがない場合は登録できないこと" do
      user = User.new(nickname: "", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    it "emailが不正な場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "aaaaaaaaa", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordがない場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "", password_confirmation: "", birth_year: "1994", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "passwordが7文字以下なら登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "1", password_confirmation: "1", birth_year: "1994", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
    it "passwordが129文字以上なら登録できないこと" do
      pass = ""
      for i in 1..129 do
        pass += "1"
      end
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: pass, password_confirmation: pass, birth_year: "1994", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:password]).to include("は128文字以内で入力してください")
    end
    it "passwordとpassword_confirmationが異なると登録できない" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "1111111", password_confirmation: "2111111", birth_year: "1994", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "birth_yearがない場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end
    it "birth_yearが不正な場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "あ", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:birth_year]).to include("は不正な値です")
    end

    it "birth_monthがない場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end
    it "birth_monthが数値でない場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "あ", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:birth_month]).to include("は数値で入力してください")
    end
    it "birth_monthが0より小さい場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "0", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:birth_month]).to include("は0より大きい値にしてください")
    end
    it "birth_monthが13より大きい場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "13", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:birth_month]).to include("は13より小さい値にしてください")
    end

    it "birth_dayがない場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "8", birth_day: "", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end
    it "birth_dayが数値でない場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "8", birth_day: "あ", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:birth_day]).to include("は数値で入力してください")
    end
    it "birth_dayが0より小さい場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "8", birth_day: "0", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:birth_day]).to include("は0より大きい値にしてください")
    end
    it "birth_dayが32より大きい場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "8", birth_day: "32", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "08011111111")
      user.valid?
      expect(user.errors[:birth_day]).to include("は32より小さい値にしてください")
    end

    it "tel_numberがない場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "")
      user.valid?
      expect(user.errors[:tel_number]).to include("を入力してください")
    end
    it "tel_numberが数値でない場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "あああああ")
      user.valid?
      expect(user.errors[:tel_number]).to include("は数値で入力してください")
    end
    it "tel_numberが10文字以下である場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "1")
      user.valid?
      expect(user.errors[:tel_number]).to include("は10文字以上で入力してください")
    end
    it "tel_numberが11文字以上である場合は登録できないこと" do
      user = User.new(nickname: "フミヤ", email: "Fumiya.Soeno@gmail.com", password: "00000000", password_confirmation: "00000000", birth_year: "1994", birth_month: "8", birth_day: "17", firstname: "添野", lastname: "文哉", firstname_kana: "そえの", lastname_kana: "ふみや", tel_number: "111111111111")
      user.valid?
      expect(user.errors[:tel_number]).to include("は11文字以内で入力してください")
    end
  end
end