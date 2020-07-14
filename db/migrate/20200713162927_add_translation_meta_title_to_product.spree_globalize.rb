# This migration comes from spree_globalize (originally 20171003153758)
class AddTranslationMetaTitleToProduct < SpreeExtension::Migration[4.2]
  def change
    reversible do |dir|
      dir.up do
        Spree::Product.add_translation_fields! meta_title: :text
      end

      dir.down do
        remove_column :spree_product_translations, :meta_title
      end
    end
  end
end
