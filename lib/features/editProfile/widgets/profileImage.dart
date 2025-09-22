import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watch_app/utils/app_textstyle.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Stack(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/avatar.jpg'),
                fit: BoxFit.cover,
              ),
            ), // BoxDecoration
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => ShowImagePickerBottomSheet(context, isDark),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: isDark
                          ? Colors.black.withOpacity(0.2)
                          : Colors.grey.shade400,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ), // BoxShadow
                  ],
                ),
                child: Icon(Icons.camera, color: Colors.white, size: 20),
              ), // Container
            ),
          ),
        ],
      ), // Stack
    ); // Center
  }

  void ShowImagePickerBottomSheet(BuildContext context, bool isDark) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Example color
              blurRadius: 10,
              offset: Offset(0, -5), // Example offset
            ),
          ], // BoxShadow
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[700] : Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Change Profile Picture',
              style: AppTextstyle.withColor(
                AppTextstyle.h3,
                Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ), // Text
            const SizedBox(height: 24),
            BuilOptionTile(
              context,
              "Take A Photo",
              Icons.camera_alt_outlined,
              () => Get.back(),
              isDark
            ),

            const SizedBox(height: 24),
            BuilOptionTile(
              context,
              "Choose from Gallery",
              Icons.photo_library_outlined,
              () => Get.back(),
              isDark
            ),

          ],
        ),
      ),
    );
  }


  Widget BuilOptionTile(
    BuildContext context,
    String Title,
    IconData icon,
    VoidCallback onTap,
    bool isDark,
  ){
      return InkWell(
          onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ], 
        ), 
        child: Row(
          children: [
             Icon(
              icon,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
            Text(
              "title",
              style: AppTextstyle.withColor(
                AppTextstyle.bodyMedium,
                Theme.of(context).textTheme.bodyLarge!.color!
              ),
              
            ),
            const Spacer(),
            Icon(
              Icons.arrow_back_ios,
              color: isDark? Colors.grey[400] : Colors.grey[700],
            )
          ],
        ),
      )
      );
  }




}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:watch_app/utils/app_textstyle.dart';

// class ProfileImage extends StatelessWidget {
//   const ProfileImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // Profile picture with camera overlay
//         Center(
//           child: Stack(
//             children: [
//               Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: Theme.of(context).primaryColor,
//                     width: 2,
//                   ),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/avatar.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: GestureDetector(
//                   onTap: () => showImagePickerBottomSheet(context, isDark),
//                   child: Container(
//                     padding: const EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).primaryColor,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: isDark
//                               ? Colors.black.withOpacity(0.2)
//                               : Colors.grey.shade400,
//                           blurRadius: 8,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child:
//                         const Icon(Icons.camera_alt, color: Colors.white, size: 18),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(height: 24),

//         // Change Profile Picture button
//         GestureDetector(
//           onTap: () => showImagePickerBottomSheet(context, isDark),
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
//             decoration: BoxDecoration(
//               color: Theme.of(context).cardColor,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: isDark
//                       ? Colors.black.withOpacity(0.2)
//                       : Colors.grey.withOpacity(0.1),
//                   blurRadius: 8,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.camera_alt_outlined,
//                     color: Theme.of(context).primaryColor, size: 20),
//                 const SizedBox(width: 8),
//                 Text(
//                   "Change Profile Picture",
//                   style: AppTextstyle.withColor(
//                     AppTextstyle.h3,
//                     Theme.of(context).textTheme.bodyLarge!.color!,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void showImagePickerBottomSheet(BuildContext context, bool isDark) {
//     Get.bottomSheet(
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//         decoration: BoxDecoration(
//           color: Theme.of(context).scaffoldBackgroundColor,
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               "Choose an option",
//               style: Theme.of(context).textTheme.titleMedium,
//             ),
//             const SizedBox(height: 16),
//             buildOptionTile(context, "Take a Photo", Icons.camera_alt, () {
//               Get.back();
//             }, isDark),
//             const SizedBox(height: 12),
//             buildOptionTile(context, "Choose from Gallery", Icons.photo, () {
//               Get.back();
//             }, isDark),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildOptionTile(
//       BuildContext context, String title, IconData icon, VoidCallback onTap, bool isDark) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         padding: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: Theme.of(context).cardColor,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: isDark
//                   ? Colors.black.withOpacity(0.2)
//                   : Colors.grey.withOpacity(0.1),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Icon(icon, color: Theme.of(context).primaryColor, size: 24),
//             const SizedBox(width: 12),
//             Text(title, style: Theme.of(context).textTheme.bodyLarge),
//           ],
//         ),
//       ),
//     );
//   }
// }

















//thirdtry
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // Note: Assuming AppTextstyle is a valid utility class.
// // import 'package:watch_app/utils/app_textstyle.dart';

// class ProfileImage extends StatelessWidget {
//   const ProfileImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         // Profile picture with camera icon overlay
//         Center(
//           child: Stack(
//             children: [
//               Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: Theme.of(context).primaryColor,
//                     width: 2,
//                   ),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/avatar.jpg'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 0,
//                 child: GestureDetector(
//                   onTap: () => _showImagePickerBottomSheet(context, isDark),
//                   child: Container(
//                     padding: const EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).primaryColor,
//                       shape: BoxShape.circle,
//                       boxShadow: [
//                         BoxShadow(
//                           color: isDark
//                               ? Colors.black.withOpacity(0.2)
//                               : Colors.grey.shade400,
//                           blurRadius: 8,
//                           offset: const Offset(0, 2),
//                         ),
//                       ],
//                     ),
//                     child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 24),
//         // "Change Profile Picture" button
//         GestureDetector(
//           onTap: () => _showImagePickerBottomSheet(context, isDark),
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
//             decoration: BoxDecoration(
//               color: Theme.of(context).cardColor,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: isDark
//                       ? Colors.black.withOpacity(0.2)
//                       : Colors.grey.withOpacity(0.1),
//                   blurRadius: 8,
//                   offset: const Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.camera_alt_outlined,
//                     color: Theme.of(context).primaryColor, size: 20),
//                 const SizedBox(width: 8),
//                 Text(
//                   "Change Profile Picture",
//                   style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   void _showImagePickerBottomSheet(BuildContext context, bool isDark) {
//     Get.bottomSheet(
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
//         decoration: BoxDecoration(
//           color: Theme.of(context).scaffoldBackgroundColor,
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//           boxShadow: [
//             BoxShadow(
//               color: isDark ? Colors.black.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
//               blurRadius: 10,
//               offset: const Offset(0, -5),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Center(
//               child: Container(
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: isDark ? Colors.grey[700] : Colors.grey[300],
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             Text(
//               'Change Profile Picture',
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.titleLarge,
//             ),
//             const SizedBox(height: 24),
//             _buildOptionTile(
//               context,
//               "Take A Photo",
//               Icons.camera_alt_outlined,
//               () => Get.back(),
//               isDark,
//             ),
//             const SizedBox(height: 16),
//             _buildOptionTile(
//               context,
//               "Choose from Gallery",
//               Icons.photo_library_outlined,
//               () => Get.back(),
//               isDark,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildOptionTile(
//     BuildContext context,
//     String title,
//     IconData icon,
//     VoidCallback onTap,
//     bool isDark,
//   ) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//         decoration: BoxDecoration(
//           color: Theme.of(context).cardColor,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: isDark
//                   ? Colors.black.withOpacity(0.2)
//                   : Colors.grey.withOpacity(0.1),
//               blurRadius: 8,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: Theme.of(context).primaryColor,
//               size: 24,
//             ),
//             const SizedBox(width: 16),
//             Text(
//               title, // Correctly using the parameter
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//             const Spacer(),
//             Icon(
//               Icons.arrow_forward_ios,
//               color: isDark ? Colors.grey[400] : Colors.grey[700],
//               size: 16,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
