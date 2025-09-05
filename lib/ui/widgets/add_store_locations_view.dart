// ui/widgets/add_store_locations_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../resources/assets.dart';
import '../notifier/business_setup_notifier.dart';
import '../themes/color_constants.dart';

class AddStoreLocationsView extends ConsumerWidget {
  const AddStoreLocationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Text(
              'Add Multiple Store Location',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                height: 1.2,
              ),
            ),
            // Scrollable content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Stack(
                  children: [
                    Image.asset(
                      DummyAssets.map,
                      width: double.infinity,
                      height: 400.h,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 14.h,
                        bottom: 10.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final state = ref.watch(businessSetupProvider);
                          return CustomTextFieldWithDropdown(
                            // key: ValueKey(
                            //   state.selectedAddress,
                            // ), // Force rebuild when address is cleared
                            hintText: 'Enter your address here',
                            suggestions: [
                              'abc Address America',
                              'xyz Address America',
                              '123 Address America',
                            ],
                            controller: ref
                                .read(businessSetupProvider.notifier)
                                .addressController,
                            onSelected: (selectedValue) {
                              // Update selected address in Riverpod state
                              ref
                                  .read(businessSetupProvider.notifier)
                                  .updateSelectedAddress(selectedValue);
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(businessSetupProvider);
                    final canAdd =
                        state.selectedAddress != null &&
                        state.selectedAddress!.isNotEmpty;
                    return Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: canAdd
                            ? () {
                                ref
                                    .read(businessSetupProvider.notifier)
                                    .addBusinessLocation();
                                ref
                                    .read(businessSetupProvider.notifier)
                                    .addressController
                                    .clear();
                              }
                            : null,
                        child: Container(
                          width: 86.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                            gradient: canAdd
                                ? const LinearGradient(
                                    colors: [
                                      Color(0xFF3C70FF),
                                      Color(0xFF8FADFF),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  )
                                : null,
                            color: canAdd ? null : Colors.grey[300],
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 12.w,
                                vertical: 5.h,
                              ),
                              child: Text(
                                'Add More',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 15.h),
                // Business address List
                Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(businessSetupProvider);
                    // Show business locations if they exist
                    if (state.businessLocation.isNotEmpty) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.businessLocation.length,
                        itemBuilder: (context, index) {
                          final location = state.businessLocation[index];
                          return Container(
                            height: 64.h,
                            margin: EdgeInsets.only(bottom: 12.h),
                            decoration: BoxDecoration(
                              //  color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r),
                              border: Border.all(
                                color: AppColors.kPrimaryColor,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Store ${index + 1}',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF4A4A4A),
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          location,
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Color(0xFF888888),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => ref
                                        .read(businessSetupProvider.notifier)
                                        .removeBusinessLocation(index),
                                    icon: Icon(
                                      Iconsax.trash,
                                      color: Colors.red,
                                      size: 20.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }

                    // Show business hours if locations are empty but hours exist

                    // Show empty state
                    return SizedBox(
                      height: 100.h,
                      child: Center(
                        child: Text(
                          'No business address added yet',
                          style: TextStyle(color: Colors.grey, fontSize: 16.sp),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFieldWithDropdown extends ConsumerStatefulWidget {
  final String? hintText;
  final List<String> suggestions;
  final Function(String?)? onSelected;
  final TextEditingController? controller;

  const CustomTextFieldWithDropdown({
    super.key,
    this.hintText,
    required this.suggestions,
    this.onSelected,
    this.controller,
  });

  @override
  ConsumerState<CustomTextFieldWithDropdown> createState() =>
      _CustomTextFieldWithDropdownState();
}

class _CustomTextFieldWithDropdownState
    extends ConsumerState<CustomTextFieldWithDropdown> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isDropdownOpen = false;
  List<String> _filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _filteredSuggestions = widget.suggestions;

    _controller.addListener(() {
      // Check if widget is still mounted before calling setState
      if (mounted) {
        _filterSuggestions(_controller.text);
        if (!_isDropdownOpen && _controller.text.isNotEmpty) {
          _showDropdown();
        } else if (_isDropdownOpen && _controller.text.isEmpty) {
          _hideDropdown();
        }
      }
    });

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        // Delay hiding to allow tap on dropdown items
        Future.delayed(Duration(milliseconds: 150), () {
          // Check if widget is still mounted before hiding dropdown
          if (mounted && !_focusNode.hasFocus) {
            _hideDropdown();
          }
        });
      }
    });
  }

  void _filterSuggestions(String query) {
    // Additional check to ensure widget is still mounted
    if (!mounted) return;

    setState(() {
      if (query.isEmpty) {
        _filteredSuggestions = widget.suggestions;
      } else {
        _filteredSuggestions = widget.suggestions
            .where(
              (suggestion) =>
                  suggestion.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });

    if (_isDropdownOpen) {
      _overlayEntry?.markNeedsBuild();
    }
  }

  void _showDropdown() {
    if (_isDropdownOpen || _filteredSuggestions.isEmpty || !mounted) return;

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    if (mounted) {
      setState(() {
        _isDropdownOpen = true;
      });
    }
  }

  void _hideDropdown() {
    if (!_isDropdownOpen) return;

    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) {
      setState(() {
        _isDropdownOpen = false;
      });
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(7.r),
            child: Container(
              constraints: BoxConstraints(maxHeight: 200.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7.r),
                border: Border.all(color: AppColors.kPrimaryColor, width: 1.w),
              ),
              child: _filteredSuggestions.isEmpty
                  ? Padding(
                      padding: EdgeInsets.all(16.w),
                      child: Text(
                        'No suggestions found',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.greyColor,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: _filteredSuggestions.length,
                      itemBuilder: (context, index) {
                        final suggestion = _filteredSuggestions[index];
                        return InkWell(
                          onTap: () {
                            // Check if widget is still mounted before updating
                            if (mounted) {
                              _controller.text = suggestion;
                              widget.onSelected?.call(suggestion);
                              _hideDropdown();
                              _focusNode.unfocus();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 13.w,
                              vertical: 12.h,
                            ),
                            decoration: BoxDecoration(
                              border: index < _filteredSuggestions.length - 1
                                  ? Border(
                                      bottom: BorderSide(
                                        color: AppColors.lightGreyColor,
                                        width: 0.5.w,
                                      ),
                                    )
                                  : null,
                            ),
                            child: Text(
                              suggestion,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.blackColor2,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Remove listeners before disposing
    _controller.removeListener(() {});
    _focusNode.removeListener(() {});

    // Hide dropdown and clean up
    _hideDropdown();

    // Dispose resources
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        style: TextStyle(fontSize: 14.sp, color: AppColors.blackColor2),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightGreyColor,
          hintText: widget.hintText,
          hintStyle: TextStyle(fontSize: 14.sp, color: AppColors.blackColor2),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 1.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(color: AppColors.kPrimaryColor, width: 1.w),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 13.w,
            vertical: 10.h,
          ),
          suffixIcon: _isDropdownOpen
              ? Icon(Icons.keyboard_arrow_up, color: AppColors.kPrimaryColor)
              : Icon(Icons.keyboard_arrow_down, color: AppColors.kPrimaryColor),
        ),
        onTap: () {
          if (!_isDropdownOpen && _filteredSuggestions.isNotEmpty && mounted) {
            _showDropdown();
          }
        },
      ),
    );
  }
}
