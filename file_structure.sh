#!/bin/bash

# Define the base directory
BASE_DIR="lib"

# Create the base directory and subdirectories
mkdir -p $BASE_DIR/models \
         $BASE_DIR/view_models \
         $BASE_DIR/services \
         $BASE_DIR/screens/home \
         $BASE_DIR/screens/real_estate_listing \
         $BASE_DIR/screens/real_estate_detail \
         $BASE_DIR/widgets/common \
         $BASE_DIR/widgets/real_estate_listing \
         $BASE_DIR/widgets/real_estate_detail

# Create .dart files in their respective directories
touch $BASE_DIR/models/real_estate.dart \
      $BASE_DIR/models/real_estate_listing_type.dart \
      $BASE_DIR/models/real_estate_category.dart \
      $BASE_DIR/view_models/real_estate_view_model.dart \
      $BASE_DIR/view_models/real_estate_list_view_model.dart \
      $BASE_DIR/services/real_estate_service.dart \
      $BASE_DIR/screens/home/home_screen.dart \
      $BASE_DIR/screens/real_estate_listing/real_estate_list_screen.dart \
      $BASE_DIR/screens/real_estate_detail/real_estate_detail_screen.dart \
      $BASE_DIR/widgets/common/loading_indicator.dart \
      $BASE_DIR/widgets/common/error_indicator.dart \
      $BASE_DIR/widgets/common/custom_app_bar.dart \
      $BASE_DIR/widgets/real_estate_listing/real_estate_list.dart \
      $BASE_DIR/widgets/real_estate_listing/real_estate_list_item.dart \
      $BASE_DIR/main.dart

echo "File structure created successfully."
