// Purpose: Provides a mock API for fetching seller details and reviews.
// File: seller_repository.dart
// Folder: lib/data/repositories/


import 'package:spicypickles/app/data/models/review_model.dart' show ReviewModel;
import 'package:spicypickles/app/data/models/seller_details_model.dart' show SellerDetailsModel;

class SellerRepository {
  Future<SellerDetailsModel> fetchSellerDetails() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    return SellerDetailsModel(
      name: 'Grandma\'s Pickles',
      tagline: 'Traditional Homemade Pickles • Since 1985',
      logoUrl: 'https://readdy.ai/api/search-image?query=Minimalist%2520pickle%2520jar%2520logo%252C%2520green%2520and%2520gold%2520colors%252C%2520professional%2520brand%2520design%252C%2520clean%2520background&width=200&height=200&seq=301&orientation=squarish',
      overallRating: 4.8,
      totalReviews: 230,
      deliveryTime: '30-40 min',
      distance: '2.4 miles',
      features: ['Featured', 'Pure Veg'],
      offers: ['20% OFF Today', 'Free Delivery'],
      minOrder: '\$20',
      description: 'Grandma\'s Pickles has been serving authentic homemade pickles since 1985. Our recipes have been passed down through generations, preserving the traditional flavors while ensuring the highest quality.',
      openingHours: [
        'Monday - Saturday: 9:00 AM - 8:00 PM',
        'Sunday: 10:00 AM - 6:00 PM',
      ],
      contactPhone: '(555) 123-4567',
      contactEmail: 'info@grandmaspickles.com',
      mapImageUrl: 'https://public.readdy.ai/gen_page/map_placeholder_1280x720.png',
    );
  }

  Future<List<ReviewModel>> fetchRecentReviews() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      ReviewModel(
        id: 'r1',
        reviewerName: 'Emily Richardson',
        reviewerImageUrl: 'https://readdy.ai/api/search-image?query=professional%2520headshot%2520of%2520middle-aged%2520woman%2520with%2520short%2520brown%2520hair%2520smiling%2520at%2520camera%252C%2520neutral%2520background&width=100&height=100&seq=401&orientation=squarish',
        rating: 5.0,
        date: 'June 2, 2025',
        comment: 'The mango pickle is absolutely amazing! Tastes just like my grandmother used to make. Perfect balance of sweet and spicy. Will definitely order again!',
        imageUrls: [],
      ),
      ReviewModel(
        id: 'r2',
        reviewerName: 'Michael Thompson',
        reviewerImageUrl: 'https://readdy.ai/api/search-image?query=professional%2520headshot%2520of%2520young%2520man%2520with%2520glasses%2520and%2520short%2520dark%2520hair%252C%2520neutral%2520background&width=100&height=100&seq=402&orientation=squarish',
        rating: 4.0,
        date: 'May 28, 2025',
        comment: 'The mixed pickle is excellent, though a bit too spicy for my taste. Quality is top-notch and delivery was prompt. Would recommend!',
        imageUrls: ['https://readdy.ai/api/search-image?query=close-up%2520of%2520mixed%2520vegetable%2520pickle%2520on%2520a%2520plate%252C%2520colorful%2520vegetables%2520in%2520spicy%2520oil%252C%2520food%2520photography&width=200&height=200&seq=403&orientation=squarish'],
      ),
      ReviewModel(
        id: 'r3',
        reviewerName: 'Robert Johnson',
        reviewerImageUrl: 'https://readdy.ai/api/search-image?query=professional%2520headshot%2520of%2520elderly%2520man%2520with%2520gray%2520hair%2520and%2520warm%2520smile%252C%2520neutral%2520background&width=100&height=100&seq=404&orientation=squarish',
        rating: 5.0,
        date: 'May 20, 2025',
        comment: 'I\'ve been buying pickles from Grandma\'s for over 5 years now. Their quality has always been consistent and the taste is unmatched. The lemon pickle is my absolute favorite!',
        imageUrls: [],
      ),
    ];
  }
}
