require 'curl'
require 'json'

module PlentyClient
  autoload :Version,    'plenty_client/version'
  autoload :Config,     'plenty_client/config'
  autoload :Endpoint,   'plenty_client/endpoint'
  autoload :Request,    'plenty_client/request'
  autoload :Constants,  'plenty_client/constants'

  autoload :Accounting,     'plenty_client/accounting'
  autoload :Authentication, 'plenty_client/authentication'
  autoload :Authorization,  'plenty_client/authorization'
  autoload :Order,          'plenty_client/order'
  autoload :Item,           'plenty_client/item'
  autoload :ItemSet,        'plenty_client/item_set'

  module Item
    autoload :Attribute,                  'plenty_client/item/attribute'
    autoload :Barcode,                    'plenty_client/item/barcode'
    autoload :CrossSelling,               'plenty_client/item/cross_selling'
    autoload :Image,                      'plenty_client/item/image'
    autoload :Manufacturer,               'plenty_client/item/manufacturer'
    autoload :Property,                   'plenty_client/item/property'
    autoload :PropertyGroup,              'plenty_client/item/property_group'
    autoload :PropertyGroupName,          'plenty_client/item/property_group_name'
    autoload :SalesPrice,                 'plenty_client/item/sales_price'
    autoload :SalesPriceShippingProfile,  'plenty_client/item/sales_price_shipping_profile'
    autoload :Unit,                       'plenty_client/item/unit'
    autoload :UnitName,                   'plenty_client/item/unit_name'
    autoload :Variation,                  'plenty_client/item/variation'
    autoload :VariationProperty,          'plenty_client/item/variation_property'
    autoload :VariationPropertyValue,     'plenty_client/item/variation_property_value'

    module Attribute
      autoload :Name,       'plenty_client/item/attribute/name'
      autoload :Value,      'plenty_client/item/attribute/value'
      autoload :ValueName,  'plenty_client/item/attribute/value_name'
    end

    module Image
      autoload :Availability, 'plenty_client/item/image/availability'
      autoload :Name,         'plenty_client/item/attribute/name'
    end

    module Manufacturer
      autoload :Commission, 'plenty_client/item/image/commission'
    end

    module Property
      autoload :MarketReference,  'plenty_client/item/property/market_reference'
      autoload :Name,             'plenty_client/item/property/name'
    end

    module Variation
      autoload :Barcode,            'plenty_client/item/variation/barcode'
      autoload :Bundle,             'plenty_client/item/variation/bundle'
      autoload :Category,           'plenty_client/item/variation/category'
      autoload :Client,             'plenty_client/item/variation/client'
      autoload :DefaultCategory,    'plenty_client/item/variation/default_category'
      autoload :Description,        'plenty_client/item/variation/description'
      autoload :Image,              'plenty_client/item/variation/image'
      autoload :Market,             'plenty_client/item/variation/market'
      autoload :MarketIdentNumber,  'plenty_client/item/variation/market_ident_number'
      autoload :SalesPrice,         'plenty_client/item/variation/sales_price'
      autoload :Sku,                'plenty_client/item/variation/sku'
      autoload :Stock,              'plenty_client/item/variation/stock'
      autoload :Supplier,           'plenty_client/item/variation/supplier'
      autoload :Warehouse,          'plenty_client/item/variation/warehouse'
    end
  end

  module ItemSet
    autoload :Component,  'plenty_client/item_set/component'
    autoload :Config,     'plenty_client/item_set/config'
  end

  module Order
    autoload :CouponCode,       'plenty_client/order/coupon_code'
    autoload :Currency,         'plenty_client/order/currency'
    autoload :Date,             'plenty_client/order/date'
    autoload :Item,             'plenty_client/order/item'
    autoload :Property,         'plenty_client/order/property'
    autoload :Referrer,         'plenty_client/order/referrer'
    autoload :Shipping,         'plenty_client/order/shipping'

    module Item
      autoload :Date,         'plenty_client/order/item/date'
      autoload :Property,     'plenty_client/order/item/property'
      autoload :SerialNumber, 'plenty_client/order/item/serial_number'
    end

    module Shipping
      autoload :Country,          'plenty_client/order/shipping/country'
      autoload :Information,      'plenty_client/order/shipping/information'
      autoload :Package,          'plenty_client/order/shipping/package'
      autoload :Profile,          'plenty_client/order/shipping/profile'
      autoload :ServiceProvider,  'plenty_client/order/shipping/service_provider'
    end
  end

  module SalesPrice
    autoload :Account,        'plenty_client/sales_price/account'
    autoload :Country,        'plenty_client/sales_price/country'
    autoload :Currency,       'plenty_client/sales_price/currency'
    autoload :CustomerClass,  'plenty_client/sales_price/customer_class'
    autoload :Name,           'plenty_client/sales_price/name'
    autoload :OnlineStore,    'plenty_client/sales_price/online_store'
    autoload :Referrer,       'plenty_client/sales_price/referrer'
  end
end
