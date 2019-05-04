class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers: [:facebook, :google_oauth2]
  validates :nickname,:first_name,:first_name_kana,:last_name,:last_name_kana,:city,:address,:zip_code,:telephone,:birth_year,:birth_month,:birth_day,presence: true
  validates :zip_code,length: { maximum:7 }
  validates :zip_code,length: { minimum:7 }
  validates :telephone ,numericality:true
  has_many   :items
  has_many   :orders
  has_many   :profits
  has_many   :points
  has_many   :communications
  has_many   :likes
  has_many   :flags
  has_many   :rate_counts
  has_many   :message_items,    through: :communications, source: :item
  has_many   :like_items,       through: :likes,          source: :item
  has_many   :flag_items,       through: :flags,          source: :item
  has_many   :rating_items,     through: :rate_counts,     source: :item
  has_many   :sns_credentials, dependent: :destroy

  has_many   :payment_information
  belongs_to :prefecture, optional: true

  # def self.find_oauth(auth)
  #   uid = auth.uid
  #   provider = auth.provider
  #   snscredential = SnsCredential.where(uid: uid, provider: provider).first
  #   if snscredential.present?
  #     user = User.where(id: snscredential.user_id).first
  #   else
  #     user = User.where(email: auth.info.email).first
  #     if user.present?
  #       SnsCredential.create(
  #         uid: uid,
  #         provider: provider,
  #         user_id: user.id
  #         )
  #     else
  #       user = User.create(
  #         nickname: auth.info.name,
  #         email:    auth.info.email,
  #         password: Devise.friendly_token[0, 20],
  #         telephone: "08000000000"
  #         )
  #       SnsCredential.create(
  #         uid: uid,
  #         provider: provider,
  #         user_id: user.id
  #         )
  #     end
  #   end
  #   return user
  # end
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    # binding.pry

    if snscredential.present? #sns登録のみ完了してるユーザー
      user = User.where(id: snscredential.user_id).first
      unless user.present? #ユーザーが存在しないなら
        user = User.new(
          # snsの情報
          # binding.pry => auth.infoとかで確認 
          nickname: auth.info.name,
          email: auth.info.email
        )
      end
      sns = snscredential
      #binding.pry

    else #sns登録 未
      user = User.where(email: auth.info.email).first
      if user.present? #会員登録 済
        sns = SnsCredential.new(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else #会員登録 未
        user = User.new(
          nickname: auth.info.name,
          email: auth.info.email
        )
        # binding.pry
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
        # binding.pry 
      end
    end
    # binding.pry
    # hashでsnsのidを返り値として保持しておく
    return { user: user , sns_id: sns.id }
  end
end
