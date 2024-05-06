class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end

# ActiveStorageを使って画像を表示する際には、どのモデルに対して画像を使うのかを宣言する必要がある
# 今回は、Listモデルに画像をつけたいので、app/models/list.rbを開く（カリキュラムでの説明）だからapp/modelsの中にあるこのファイル開いた
# 画像投稿機能PostImageモデル
class PostImage < ApplicationRecord
  has_one_attached :image
end