require 'json'

module PlentyClient
  class ConnectionError < StandardError; end
  class ClientError < ConnectionError; end
  class RedirectionError < ConnectionError; end
  class ServerError < ConnectionError; end
  class ResponseError < ConnectionError; end
  class NotFound < ResponseError; end

  autoload :Config,       'plenty_client/config'
  autoload :Constants,    'plenty_client/constants'
  autoload :Endpoint,     'plenty_client/endpoint'
  autoload :Request,      'plenty_client/request'
  autoload :Version,      'plenty_client/version'

  autoload :Account,        'plenty_client/account'
  autoload :Accounting,     'plenty_client/accounting'
  autoload :Authentication, 'plenty_client/authentication'
  autoload :Authorization,  'plenty_client/authorization'
  autoload :Basket,         'plenty_client/basket'
  autoload :Category,       'plenty_client/category'
  autoload :Comment,        'plenty_client/comment'
  autoload :Document,       'plenty_client/document'
  autoload :Item,           'plenty_client/item'
  autoload :ItemSet,        'plenty_client/item_set'
  autoload :Listing,        'plenty_client/listing'
  autoload :Order,          'plenty_client/order'
  autoload :OrderSummary,   'plenty_client/order_summary'
  autoload :Payment,        'plenty_client/payment'
  autoload :Stock,          'plenty_client/stock'
  autoload :Warehouse,      'plenty_client/warehouse'
  autoload :Webstore,       'plenty_client/webstore'

  module Concerns
    autoload :RestRoutes, 'plenty_client/concerns/rest_routes'
  end

  module Account
    autoload :Contact, 'plenty_client/account/contact'
    autoload :Address, 'plenty_client/account/address'

    module Contact
      autoload :Address,  'plenty_client/account/contact/address'
      autoload :Bank,     'plenty_client/account/contact/bank'
      autoload :Type,     'plenty_client/account/contact/type'
    end
  end

  module Basket
    autoload :Item, 'plenty_client/basket/item'
  end

  module Category
    autoload :Branch,   'plenty_client/category/branch'
    autoload :Template, 'plenty_client/category/template'
  end

  module Document
    autoload :Category, 'plenty_client/document/category'
    autoload :Order,    'plenty_client/document/order'
  end

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
    autoload :ShippingProfile,            'plenty_client/item/shipping_profile'
    autoload :Unit,                       'plenty_client/item/unit'
    autoload :UnitName,                   'plenty_client/item/unit_name'
    autoload :Variation,                  'plenty_client/item/variation'

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
      autoload :Property,           'plenty_client/item/variation/property'
      autoload :SalesPrice,         'plenty_client/item/variation/sales_price'
      autoload :Sku,                'plenty_client/item/variation/sku'
      autoload :Stock,              'plenty_client/item/variation/stock'
      autoload :Supplier,           'plenty_client/item/variation/supplier'
      autoload :Warehouse,          'plenty_client/item/variation/warehouse'

      module Property
        autoload :Text, 'plenty_client/item/variation/property/text'
      end
    end
  end

  module ItemSet
    autoload :Component,  'plenty_client/item_set/component'
    autoload :Config,     'plenty_client/item_set/config'
  end

  module Listing
    autoload :LayoutTemplate,       'plenty_client/listing/layout_template'
    autoload :Market,               'plenty_client/listing/market'
    autoload :OptionTemplate,       'plenty_client/listing/option_template'
    autoload :ShippingProfile,      'plenty_client/listing/shipping_profile'
    autoload :StockDependenceType,  'plenty_client/listing/stock_dependencetype'
    autoload :Type,                 'plenty_client/listing/type'

    module Market
      autoload :Directory,      'plenty_client/listing/market/directory'
      autoload :Info,           'plenty_client/listing/market/info'
      autoload :History,        'plenty_client/listing/market/history'
      autoload :Text,           'plenty_client/listing/market/text'
    end
  end

  module Market
    autoload :Credentials, 'plenty_client/market/credentials'

    module Ebay
      autoload :Authentication, 'plenty_client/market/ebay/authentication'
      autoload :PartsFitment,   'plenty_client/market/ebay/parts_fitment'
      autoload :ShopCategory,   'plenty_client/market/ebay/shop_category'
    end
  end

  module Order
    autoload :CouponCode,       'plenty_client/order/coupon_code'
    autoload :Currency,         'plenty_client/order/currency'
    autoload :Date,             'plenty_client/order/date'
    autoload :Item,             'plenty_client/order/item'
    autoload :Property,         'plenty_client/order/property'
    autoload :Referrer,         'plenty_client/order/referrer'
    autoload :Shipping,         'plenty_client/order/shipping'
    autoload :StatusHistory,    'plenty_client/order/status_history'

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

  module Payment
    autoload :Contact,      'plenty_client/payment/contact'
    autoload :Method,       'plenty_client/payment/method'
    autoload :MethodName,   'plenty_client/payment/method_name'
    autoload :Order,        'plenty_client/payment/order'
    autoload :Property,     'plenty_client/payment/property'
    autoload :Status,       'plenty_client/payment/status'
    autoload :Transaction,  'plenty_client/payment/transaction'

    module Property
      autoload :Type, 'plenty_client/payment/property/type'

      module Type
        autoload :Name, 'plenty_client/payment/property/type/name'
      end
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

  module Warehouse
    autoload :Stock,      'plenty_client/warehouse/stock'
    autoload :Management, 'plenty_client/warehouse/management'
    autoload :Location,   'plenty_client/warehouse/location'

    module Location
      autoload :Dimension,  'plenty_client/warehouse/location/dimension'
      autoload :Level,      'plenty_client/warehouse/location/level'
    end
  end
end
