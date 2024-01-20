import '../../../routes/routes.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../personalization/models/address_model.dart';
import '../../personalization/models/user_model.dart';
import '../models/banner_model.dart';
import '../models/brand_category_model.dart';
import '../models/brand_model.dart';
import '../models/cart_item_model.dart';
import '../models/cart_model.dart';
import '../models/category_model.dart';
import '../models/order_model.dart';
import '../models/product_attribute_model.dart';
import '../models/product_category_model.dart';
import '../models/product_model.dart';
import '../models/product_review_model.dart';
// import '../models/product_variation_model.dart';

class KDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: KImages.banner1, targetScreen: KRoutes.order, active: false),
    BannerModel(
        imageUrl: KImages.banner2, targetScreen: KRoutes.cart, active: true),
    BannerModel(
        imageUrl: KImages.banner3,
        targetScreen: KRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: KImages.banner4, targetScreen: KRoutes.search, active: true),
    BannerModel(
        imageUrl: KImages.banner5,
        targetScreen: KRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: KImages.banner6,
        targetScreen: KRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: KImages.banner8,
        targetScreen: KRoutes.checkout,
        active: false),
  ];

  /// -- User
  static final UserModel user = UserModel(
    firstName: 'Rawa',
    lastName: 'Rebwar',
    email: 'rawa.priv@gmail.com',
    phoneNumber: '+964 770 226 1000',
    profilePicture: KImages.user,
    addresses: [
      AddressModel(
        id: '1',
        name: 'Rawa Swr',
        phoneNumber: '+964 770 226 1000',
        street: 'Tuimaleek',
        city: 'Slemani',
        state: 'Kurdistan',
        postalCode: '46001',
        country: 'Kurdistan',
      ),
      AddressModel(
        id: '6',
        name: 'John Doe',
        phoneNumber: '+1234567890',
        street: '123 Main Street',
        city: 'New York',
        state: 'New York',
        postalCode: '10001',
        country: 'United States',
      ),
      AddressModel(
        id: '2',
        name: 'Alice Smith',
        phoneNumber: '+9876543210',
        street: '456 Elm Avenue',
        city: 'Los Angeles',
        state: 'California',
        postalCode: '90001',
        country: 'United States',
      ),
      AddressModel(
        id: '3',
        name: 'Taimoor Sikander',
        phoneNumber: '+923178059528',
        street: 'Street 35',
        city: 'Islamabad',
        state: 'Federal',
        postalCode: '48000',
        country: 'Pakistan',
      ),
      AddressModel(
        id: '4',
        name: 'Maria Garcia',
        phoneNumber: '+5412345678',
        street: '789 Oak Road',
        city: 'Buenos Aires',
        state: 'Buenos Aires',
        postalCode: '1001',
        country: 'Argentina',
      ),
      AddressModel(
        id: '5',
        name: 'Liam Johnson',
        phoneNumber: '+447890123456',
        street: '10 Park Lane',
        city: 'London',
        state: 'England',
        postalCode: 'SW1A 1AA',
        country: 'United Kingdom',
      )
    ],
    username: '',
    id: '',
  );

  /// -- Cart
  static final CartModel cart = CartModel(
    cartId: '001',
    items: [
      CartItemModel(
        productId: '001',
        variationId: '1',
        quantity: 1,
        title: products[0].title,
        image: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
      CartItemModel(
        productId: '002',
        variationId: '',
        quantity: 1,
        title: products[1].title,
        image: products[1].thumbnail,
        brandName: products[1].brand!.name,
        price: products[1].price,
        selectedVariation: products[1].productVariations != null
            ? products[1].productVariations![1].attributeValues
            : {},
      ),
    ],
  );

  /// -- Order
  static final List<OrderModel> orders = [
    OrderModel(
        id: 'CWT0012',
        status: OrderStatus.processing,
        items: cart.items,
        totalAmount: 265,
        orderDate: DateTime(2023, 09, 1),
        deliveryDate: DateTime(2023, 09, 9)),
    OrderModel(
        id: 'CWT0025',
        status: OrderStatus.shipped,
        items: cart.items,
        totalAmount: 369,
        orderDate: DateTime(2023, 10, 2),
        deliveryDate: DateTime(2023, 10, 6)),
    OrderModel(
        id: 'CWT0152',
        status: OrderStatus.delivered,
        items: cart.items,
        totalAmount: 254,
        orderDate: DateTime(2023, 11, 3),
        deliveryDate: DateTime(2023, 11, 8)),
    OrderModel(
        id: 'CWT0265',
        status: OrderStatus.delivered,
        items: cart.items,
        totalAmount: 355,
        orderDate: DateTime(2023, 12, 20),
        deliveryDate: DateTime(2023, 12, 25)),
    OrderModel(
        id: 'CWT1536',
        status: OrderStatus.delivered,
        items: cart.items,
        totalAmount: 115,
        orderDate: DateTime(2023, 12, 25),
        deliveryDate: DateTime(2024, 01, 1)),
  ];

  /// -- List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1',
        image: KImages.headacheIcon,
        name: 'Headache',
        isFeatured: true),
    CategoryModel(
        id: '5', image: KImages.stomachIcon, name: 'Stomach', isFeatured: true),
    CategoryModel(
        id: '2', image: KImages.painIcon, name: 'Pain', isFeatured: true),
    CategoryModel(
        id: '3', image: KImages.throatIcon, name: 'Throat', isFeatured: true),
    CategoryModel(
        id: '4', image: KImages.thyroidIcon, name: 'Thyroid', isFeatured: true),
    CategoryModel(
        id: '6', image: KImages.heartIcon, name: 'Heart', isFeatured: true),
    CategoryModel(
        id: '7',
        image: KImages.diabetesIcon,
        name: 'Diabetes',
        isFeatured: true),
    CategoryModel(
        id: '14',
        image: KImages.cholesterolIcon,
        name: 'cholesterol',
        isFeatured: true),

    ///subcategories
    CategoryModel(
        id: '8',
        image: KImages.headacheIcon,
        name: 'Headache Drug',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '9',
        image: KImages.headacheIcon,
        name: 'Headache',
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        image: KImages.headacheIcon,
        name: 'headache',
        parentId: '1',
        isFeatured: false),
    //furniture
    CategoryModel(
        id: '11',
        image: KImages.stomachIcon,
        name: 'Headache',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '12',
        image: KImages.stomachIcon,
        name: 'Stomach',
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '13',
        image: KImages.stomachIcon,
        name: 'Stomach',
        parentId: '5',
        isFeatured: false),
    //electronics
    CategoryModel(
        id: '14',
        image: KImages.painIcon,
        name: 'Pain',
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '15',
        image: KImages.painIcon,
        name: 'Pain',
        parentId: '2',
        isFeatured: false),

    CategoryModel(
        id: '16',
        image: KImages.throatIcon,
        name: 'Throat',
        parentId: '3',
        isFeatured: false),
  ];

  /// -- List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: KImages.brand1Logo,
        name: 'Brand1',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: KImages.brand2Logo,
        name: 'Brand2',
        productsCount: 95,
        isFeatured: true),
    BrandModel(
        id: '8',
        image: KImages.brand3Logo,
        name: 'Brand3',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '9',
        image: KImages.brand4Logo,
        name: 'Brand4',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '5',
        image: KImages.brand5Logo,
        name: 'Brand5',
        productsCount: 16,
        isFeatured: true),
    BrandModel(
        id: '10',
        image: KImages.brand6Logo,
        name: 'Brand6',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '3',
        image: KImages.brand7Logo,
        name: 'Brand7',
        productsCount: 36,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: KImages.brand8Logo,
        name: 'Brand8',
        productsCount: 65,
        isFeatured: true),
    BrandModel(
        id: '6',
        image: KImages.brand9Logo,
        name: 'Brand9',
        productsCount: 36,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: KImages.brand10Logo,
        name: 'Brand10',
        productsCount: 36,
        isFeatured: false),
  ];

  /// -- List of all Brand Categories
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];

  /// -- List of all Product Categories
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '001', categoryId: '8'),
    ProductCategoryModel(productId: '004', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '16'),
    ProductCategoryModel(productId: '003', categoryId: '3'),
    ProductCategoryModel(productId: '005', categoryId: '1'),
    ProductCategoryModel(productId: '005', categoryId: '8'),
    ProductCategoryModel(productId: '040', categoryId: '2'),
    ProductCategoryModel(productId: '040', categoryId: '15'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '4'),
    ProductCategoryModel(productId: '009', categoryId: '1'),
    ProductCategoryModel(productId: '009', categoryId: '8'),
    ProductCategoryModel(productId: '010', categoryId: '1'),
    ProductCategoryModel(productId: '010', categoryId: '8'),
    ProductCategoryModel(productId: '011', categoryId: '1'),
    ProductCategoryModel(productId: '011', categoryId: '8'),
    ProductCategoryModel(productId: '012', categoryId: '1'),
    ProductCategoryModel(productId: '012', categoryId: '8'),
    ProductCategoryModel(productId: '013', categoryId: '1'),
    ProductCategoryModel(productId: '013', categoryId: '8'),

    ProductCategoryModel(productId: '014', categoryId: '1'),
    ProductCategoryModel(productId: '014', categoryId: '9'),
    ProductCategoryModel(productId: '015', categoryId: '1'),
    ProductCategoryModel(productId: '015', categoryId: '9'),
    ProductCategoryModel(productId: '016', categoryId: '1'),
    ProductCategoryModel(productId: '016', categoryId: '9'),
    ProductCategoryModel(productId: '017', categoryId: '1'),
    ProductCategoryModel(productId: '017', categoryId: '9'),

    ProductCategoryModel(productId: '018', categoryId: '1'),
    ProductCategoryModel(productId: '018', categoryId: '10'),
    ProductCategoryModel(productId: '019', categoryId: '1'),
    ProductCategoryModel(productId: '019', categoryId: '10'),
    ProductCategoryModel(productId: '020', categoryId: '1'),
    ProductCategoryModel(productId: '020', categoryId: '10'),
    ProductCategoryModel(productId: '021', categoryId: '1'),
    ProductCategoryModel(productId: '021', categoryId: '10'),

    ProductCategoryModel(productId: '022', categoryId: '5'),
    ProductCategoryModel(productId: '022', categoryId: '11'),
    ProductCategoryModel(productId: '023', categoryId: '5'),
    ProductCategoryModel(productId: '023', categoryId: '11'),
    ProductCategoryModel(productId: '024', categoryId: '5'),
    ProductCategoryModel(productId: '024', categoryId: '11'),
    ProductCategoryModel(productId: '025', categoryId: '5'),
    ProductCategoryModel(productId: '025', categoryId: '11'),

    ProductCategoryModel(productId: '026', categoryId: '5'),
    ProductCategoryModel(productId: '026', categoryId: '12'),
    ProductCategoryModel(productId: '027', categoryId: '5'),
    ProductCategoryModel(productId: '027', categoryId: '12'),
    ProductCategoryModel(productId: '028', categoryId: '5'),
    ProductCategoryModel(productId: '028', categoryId: '12'),

    ProductCategoryModel(productId: '029', categoryId: '5'),
    ProductCategoryModel(productId: '029', categoryId: '13'),
    ProductCategoryModel(productId: '030', categoryId: '5'),
    ProductCategoryModel(productId: '030', categoryId: '13'),
    ProductCategoryModel(productId: '031', categoryId: '5'),
    ProductCategoryModel(productId: '031', categoryId: '13'),
    ProductCategoryModel(productId: '032', categoryId: '5'),
    ProductCategoryModel(productId: '032', categoryId: '13'),

    ProductCategoryModel(productId: '033', categoryId: '2'),
    ProductCategoryModel(productId: '033', categoryId: '14'),
    ProductCategoryModel(productId: '034', categoryId: '2'),
    ProductCategoryModel(productId: '034', categoryId: '14'),
    ProductCategoryModel(productId: '035', categoryId: '2'),
    ProductCategoryModel(productId: '035', categoryId: '14'),
    ProductCategoryModel(productId: '036', categoryId: '2'),
    ProductCategoryModel(productId: '036', categoryId: '14'),

    ProductCategoryModel(productId: '037', categoryId: '2'),
    ProductCategoryModel(productId: '037', categoryId: '15'),
    ProductCategoryModel(productId: '038', categoryId: '2'),
    ProductCategoryModel(productId: '038', categoryId: '15'),
    ProductCategoryModel(productId: '039', categoryId: '2'),
    ProductCategoryModel(productId: '039', categoryId: '15'),
    //040 after product 005

    ProductCategoryModel(productId: '008', categoryId: '2'),
  ];

  /// -- List of all Products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Paracetamol 500mg',
      stock: 150,
      price: 5,
      isFeatured: true,
      thumbnail: KImages.productImage1,
      description: 'Paracetamol tablet 500mg for pain relief',
      brand: BrandModel(
          id: '1',
          image: KImages.brand1Logo,
          name: 'MediBrand',
          productsCount: 265,
          isFeatured: true),
      images: ["assets/images/products/med1.png"],
      salePrice: 4.5,
      sku: 'MED500',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Dosage', values: ['500mg', '650mg']),
      ],
      productVariations: [/*...*/],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: 'Ibuprofen 200mg',
      stock: 200,
      price: 8,
      isFeatured: false,
      thumbnail: KImages.productImage2,
      description: 'Ibuprofen tablet 200mg for inflammation and pain',
      brand: BrandModel(
          id: '2',
          image: KImages.brand2Logo,
          name: 'MediBrand',
          productsCount: 10,
          isFeatured: true),
      images: ["assets/images/products/med2.png"],
      salePrice: 7,
      sku: 'IBU200',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Dosage', values: ['200mg', '400mg']),
      ],
      productVariations: [/*...*/],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '004',
      title: 'Aspirin 100mg',
      stock: 150,
      price: 6,
      isFeatured: true,
      thumbnail: KImages.productImage4,
      description: 'Aspirin 100mg tablets for pain relief and fever reduction',
      brand: BrandModel(
          id: '3',
          image: KImages.brand3Logo,
          name: 'HealthPlus',
          productsCount: 20,
          isFeatured: true),
      images: ["assets/images/products/med3.png"],
      salePrice: 5.5,
      sku: 'ASP100',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Dosage', values: ['100mg', '300mg']),
      ],
      productVariations: [/*...*/],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '005',
      title: 'Cetirizine 10mg',
      stock: 180,
      price: 10,
      isFeatured: false,
      thumbnail: KImages.productImage5,
      description: 'Cetirizine 10mg for allergy relief',
      brand: BrandModel(
          id: '4',
          image: KImages.brand4Logo,
          name: 'AllerCare',
          productsCount: 15,
          isFeatured: false),
      images: ["assets/images/products/med4.png"],
      salePrice: 9,
      sku: 'CET10',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Dosage', values: ['10mg']),
      ],
      productVariations: [/*...*/],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '006',
      title: 'Loratadine 10mg',
      stock: 200,
      price: 12,
      isFeatured: true,
      thumbnail: KImages.productImage6,
      description: 'Loratadine 10mg tablets for seasonal allergies',
      brand: BrandModel(
          id: '5',
          image: KImages.brand5Logo,
          name: 'ClearAllergy',
          productsCount: 25,
          isFeatured: true),
      images: ["assets/images/products/med5.png"],
      salePrice: 11,
      sku: 'LORA10',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(name: 'Dosage', values: ['10mg']),
      ],
      productVariations: [/*...*/],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '007',
      title: 'Metformin 500mg',
      stock: 100,
      price: 15,
      isFeatured: false,
      thumbnail: KImages.productImage7,
      description: 'Metformin 500mg tablets for diabetes management',
      brand: BrandModel(
          id: '6',
          image: KImages.brand6Logo,
          name: 'DiabeCare',
          productsCount: 30,
          isFeatured: false),
      images: ["assets/images/products/med6.png"],
      salePrice: 14,
      sku: 'MET500',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Dosage', values: ['500mg', '1000mg']),
      ],
      productVariations: [/*...*/],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '008',
      title: 'Omeprazole 20mg',
      stock: 120,
      price: 18,
      isFeatured: true,
      thumbnail: KImages.productImage8,
      description: 'Omeprazole 20mg capsules for acid reflux and heartburn',
      brand: BrandModel(
          id: '7',
          image: KImages.brand7Logo,
          name: 'GastroHealth',
          productsCount: 18,
          isFeatured: true),
      images: ["assets/images/products/med7.png"],
      salePrice: 17,
      sku: 'OME20',
      categoryId: '5',
      productAttributes: [
        ProductAttributeModel(name: 'Dosage', values: ['20mg', '40mg']),
      ],
      productVariations: [/*...*/],
      productType: 'ProductType.variable',
    ),

    // ... Additional products can be listed in the same format
  ];

  ///Products after banner

  /// -- Sorting Filters for search
  static final sortingFilters = [
    SortFilterModel(id: '1', name: 'Name'),
    SortFilterModel(id: '2', name: 'Lowest Price'),
    SortFilterModel(id: '3', name: 'Most Popular'),
    SortFilterModel(id: '4', name: 'Highest Price'),
    SortFilterModel(id: '5', name: 'Newest'),
    SortFilterModel(id: '6', name: 'Most Suitable'),
  ];

  /// -- Product Reviews
  static final List<ProductReviewModel> productReviews = [
    ProductReviewModel(
      id: '01',
      userId: '001',
      userName: 'John Doe',
      rating: 4.5,
      timestamp: DateTime.now(),
      companyTimestamp: DateTime.now(),
      userImageUrl: KImages.userProfileImage2,
      comment:
          'The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great job!',
      companyComment:
          'Thank you for your kind words, John! We are delighted to hear about your smooth experience with the app. We always strive to offer an intuitive interface for our users. Stay tuned for more updates!',
    ),
    ProductReviewModel(
      id: '02',
      userId: '002',
      userName: 'Sophia Wilson',
      rating: 3.5,
      timestamp: DateTime.now(),
      companyTimestamp: DateTime.now(),
      userImageUrl: KImages.userProfileImage1,
      comment:
          'I am genuinely impressed with the app design and the variety of products available. The filter and sort features have made shopping so much easier for me!',
      companyComment:
          'Thank you so much, Sophia! We are thrilled to hear you are enjoying the app and finding the features useful. Our goal is to make your shopping experience as efficient and pleasant as possible. Keep exploring, and happy shopping!',
    ),
    ProductReviewModel(
      id: '03',
      userId: '003',
      userName: 'Alex Brown',
      rating: 5,
      timestamp: DateTime.now(),
      companyTimestamp: DateTime.now(),
      userImageUrl: KImages.userProfileImage3,
      comment:
          'The app is pretty fast, and the product recommendations are on point! I would love to see more features in the future.',
      companyComment:
          'Thanks for the feedback, Alex! We are thrilled to hear you enjoyed the speed and recommendations. We are constantly working on introducing new features, so keep an eye out for the next update!',
    ),
  ];
}

class SortFilterModel {
  String id;
  String name;

  SortFilterModel({required this.id, required this.name});
}
