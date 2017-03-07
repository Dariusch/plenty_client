module PlentyClient
  module Endpoint
    # Method that replaces the arguments in an endpoint with the given parameters.
    # Arguments that are passed to the build_endpoint method, but do not
    # live in the endpoint, are discarded.
    def build_endpoint(api_endpoint_template, arguments = {})
      # Duplicate constant to temporary endpoint string
      api_endpoint_result = api_endpoint_template.dup
      # Endpoint parameters hash that links symbols to regex
      endpoint_parameters = {
        account:                    /\{accountId\}/,
        account_ype:                /\{accountType\}/,
        attribute:                  /\{attributeId\}/,
        attribute_value:            /\{attributeValueId\}/,
        barcode:                    /\{barcodeId\}/,
        bundle:                     /\{bundleId\}/,
        cat:                        /\{catId\}/,
        commission:                 /\{commissionId\}/,
        component:                  /\{componentId\}/,
        comment:                    /\{commentId\}/,
        contact:                    /\{contactId\}/,
        country:                    /\{countryId\}/,
        coupon_string:              /\{coupon\}/,
        cross_item:                 /\{crossItemId\}/,
        currency:                   /\{currencyIso\}/,
        customer_class:             /\{customerClassId\}/,
        image:                      /\{imageId\}/,
        item:                       /\{itemId\}/,
        item_set:                   /\{itemSetId\}/,
        lang:                       /\{lang\}/,
        location:                   /\{locationId\}/,
        manufacturer:               /\{manufacturerId\}/,
        market:                     /\{marketId\}/,
        market_ident_number:        /\{marketIdentNumberId\}/,
        marketplace:                /\{marketplaceId\}/,
        order:                      /\{orderId\}/,
        order_item:                 /\{orderItemId\}/,
        parent_referrer:            /\{parentReferrerId\}/,
        plenty:                     /\{plentyId\}/,
        preset:                     /\{presetId\}/,
        price:                      /\{priceId\}/,
        property_group:             /\{propertyGroupId\}/,
        property:                   /\{propertyId\}/,
        referrer:                   /\{referrerId\}/,
        reference_type:             /\{referenceType\}/,
        reference_value:            /\{referenceValue\}/,
        sales_price:                /\{salesPriceId\}/,
        shipping_profile:           /\{shippingProfileId\}/,
        shipping_package:           /\{orderShippingPackageId\}/,
        shipping_service_provider:  /\{shippingServiceProviderID\}/,
        sku:                        /\{skuId\}/,
        type:                       /\{typeId\}/,
        type_string:                /\{type\}/,
        unit:                       /\{unitId\}/,
        value:                      /\{valueId\}/,
        variation:                  /\{variationId\}/,
        variation_supplier:         /\{variationSupplierId\}/,
        warehouse:                  /\{warehouseId\}/,
        webstore:                   /\{webstoreId\}/
      }
      # Loop over the given argument symbols, retrieve the corresponding regex
      # and replace the argument with the corresponding value.
      arguments.each do |k, v|
        api_endpoint_result.gsub!(endpoint_parameters.fetch(k), v.to_s)
      end

      api_endpoint_result
    end

    def routes
      # Prints all available routes with their values in the given module
      constants.each do |const|
        puts "#{const}: \t #{const_get(const)}" if const.to_s.upcase!.nil?
      end
    end
  end
end
