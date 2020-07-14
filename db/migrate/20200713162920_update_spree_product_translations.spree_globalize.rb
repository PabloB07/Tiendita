# This migration comes from spree_globalize (originally 20140219130603)
class UpdateSpreeProductTranslations < SpreeExtension::Migration[4.2]
  def change
    if column_exists?(:spree_product_translations, :permalink)
      rename_column :spree_product_translations, :permalink, :slug
    end
  end
end
