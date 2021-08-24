class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 10 }
  paginates_per 10
  scope :index_all, -> {
    select(:id, :user_id, :title, :content, :created_at) #フィールドごとにレコードを取得
    .order(created_at: :asc) #created_atカラムの昇順に並び替え
    .includes(:user) #ユーザを事前に取得してN+1防止
  }
  belongs_to :user
  has_many :comments
end
