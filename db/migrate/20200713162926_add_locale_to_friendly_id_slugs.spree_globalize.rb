# This migration comes from spree_globalize (originally 20170713120642)
class AddLocaleToFriendlyIdSlugs < SpreeExtension::Migration[4.2]
  def change
    add_column :friendly_id_slugs, :locale, :string
  end
end
