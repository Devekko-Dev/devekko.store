export type Maybe<T> = T | null;

export type Connection<T> = {
  edges: Array<Edge<T>>;
};

export type Edge<T> = {
  node: T;
};

export type Cart = Omit<DevekkoStoreCart, 'lines'> & {
  lines: CartItem[];
};

export type CartProduct = {
  id: string;
  handle: string;
  title: string;
  featuredImage: Image;
};

export type CartItem = {
  id: string | undefined;
  quantity: number;
  cost: {
    totalAmount: Money;
  };
  merchandise: {
    id: string;
    title: string;
    selectedOptions: {
      name: string;
      value: string;
    }[];
    product: CartProduct;
  };
};

export type Collection = DevekkoStoreCollection & {
  path: string;
};

export type Image = {
  url: string;
  altText: string;
  width: number;
  height: number;
};

export type Menu = {
  title: string;
  path: string;
};

export type Money = {
  amount: string;
  currencyCode: string;
};

export type Page = {
  id: string;
  title: string;
  handle: string;
  body: string;
  bodySummary: string;
  seo?: SEO;
  createdAt: string;
  updatedAt: string;
};

export type Product = Omit<DevekkoStoreProduct, 'variants' | 'images'> & {
  variants: ProductVariant[];
  images: Image[];
};

export type ProductOption = {
  id: string;
  name: string;
  values: string[];
};

export type ProductVariant = {
  id: string;
  title: string;
  availableForSale: boolean;
  selectedOptions: {
    name: string;
    value: string;
  }[];
  price: Money;
};

export type SEO = {
  title: string;
  description: string;
};

export type DevekkoStoreCart = {
  id: string | undefined;
  checkoutUrl: string;
  cost: {
    subtotalAmount: Money;
    totalAmount: Money;
    totalTaxAmount: Money;
  };
  lines: Connection<CartItem>;
  totalQuantity: number;
};

export type DevekkoStoreCollection = {
  handle: string;
  title: string;
  description: string;
  seo: SEO;
  updatedAt: string;
};

export type DevekkoStoreProduct = {
  id: string;
  handle: string;
  availableForSale: boolean;
  title: string;
  description: string;
  descriptionHtml: string;
  options: ProductOption[];
  priceRange: {
    maxVariantPrice: Money;
    minVariantPrice: Money;
  };
  variants: Connection<ProductVariant>;
  featuredImage: Image;
  images: Connection<Image>;
  seo: SEO;
  tags: string[];
  updatedAt: string;
};

export type DevekkoStoreCartOperation = {
  data: {
    cart: DevekkoStoreCart;
  };
  variables: {
    cartId: string;
  };
};

export type DevekkoStoreCreateCartOperation = {
  data: { cartCreate: { cart: DevekkoStoreCart } };
};

export type DevekkoStoreAddToCartOperation = {
  data: {
    cartLinesAdd: {
      cart: DevekkoStoreCart;
    };
  };
  variables: {
    cartId: string;
    lines: {
      merchandiseId: string;
      quantity: number;
    }[];
  };
};

export type DevekkoStoreRemoveFromCartOperation = {
  data: {
    cartLinesRemove: {
      cart: DevekkoStoreCart;
    };
  };
  variables: {
    cartId: string;
    lineIds: string[];
  };
};

export type DevekkoStoreUpdateCartOperation = {
  data: {
    cartLinesUpdate: {
      cart: DevekkoStoreCart;
    };
  };
  variables: {
    cartId: string;
    lines: {
      id: string;
      merchandiseId: string;
      quantity: number;
    }[];
  };
};

export type DevekkoStoreCollectionOperation = {
  data: {
    collection: DevekkoStoreCollection;
  };
  variables: {
    handle: string;
  };
};

export type DevekkoStoreCollectionProductsOperation = {
  data: {
    collection: {
      products: Connection<DevekkoStoreProduct>;
    };
  };
  variables: {
    handle: string;
    reverse?: boolean;
    sortKey?: string;
  };
};

export type DevekkoStoreCollectionsOperation = {
  data: {
    collections: Connection<DevekkoStoreCollection>;
  };
};

export type DevekkoStoreMenuOperation = {
  data: {
    menu?: {
      items: {
        title: string;
        url: string;
      }[];
    };
  };
  variables: {
    handle: string;
  };
};

export type DevekkoStorePageOperation = {
  data: { pageByHandle: Page };
  variables: { handle: string };
};

export type DevekkoStorePagesOperation = {
  data: {
    pages: Connection<Page>;
  };
};

export type DevekkoStoreProductOperation = {
  data: { product: DevekkoStoreProduct };
  variables: {
    handle: string;
  };
};

export type DevekkoStoreProductRecommendationsOperation = {
  data: {
    productRecommendations: DevekkoStoreProduct[];
  };
  variables: {
    productId: string;
  };
};

export type DevekkoStoreProductsOperation = {
  data: {
    products: Connection<DevekkoStoreProduct>;
  };
  variables: {
    query?: string;
    reverse?: boolean;
    sortKey?: string;
  };
};
