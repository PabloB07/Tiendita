# This migration comes from spree_globalize (originally 20171005151819)
class ChangeTranslationMetaTitleToProduct < SpreeExtension::Migration[4.2]
  def change
    change_column :spree_product_translations, :meta_title, :string
  end
end
