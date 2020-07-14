# This migration comes from spree_globalize (originally 20140206202524)
class RenameActivatorTranslationsToPromotionTranslations < SpreeExtension::Migration[4.2]
  def change
    if table_exists? 'spree_activator_translations'
      rename_table :spree_activator_translations, :spree_promotion_translations
      rename_column :spree_promotion_translations, :spree_activator_id, :spree_promotion_id
    end
  end
end
