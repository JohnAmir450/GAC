// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Arabian Gulf Company`
  String get application_name {
    return Intl.message(
      'Arabian Gulf Company',
      name: 'application_name',
      desc: '',
      args: [],
    );
  }

  /// `Start Now`
  String get start_now {
    return Intl.message(
      'Start Now',
      name: 'start_now',
      desc: '',
      args: [],
    );
  }

  /// `Discover a new experience with Arabian Gulf Company. Shop easily, explore a variety of food products, and follow prices directly to get the best offers and quality.`
  String get on_boarding_text {
    return Intl.message(
      'Discover a new experience with Arabian Gulf Company. Shop easily, explore a variety of food products, and follow prices directly to get the best offers and quality.',
      name: 'on_boarding_text',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_hint {
    return Intl.message(
      'Email',
      name: 'email_hint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_hint {
    return Intl.message(
      'Password',
      name: 'password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forget_password {
    return Intl.message(
      'Forgot Password?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get or {
    return Intl.message(
      'Or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get sign_with_google {
    return Intl.message(
      'Sign in with Google',
      name: 'sign_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get sign_with_facebook {
    return Intl.message(
      'Sign in with Facebook',
      name: 'sign_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `New Account`
  String get new_account {
    return Intl.message(
      'New Account',
      name: 'new_account',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message(
      'First Name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get last_name {
    return Intl.message(
      'Last Name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `By creating an account, you agree to our `
  String get terms_accept {
    return Intl.message(
      'By creating an account, you agree to our ',
      name: 'terms_accept',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get terms_and_conditions_sign {
    return Intl.message(
      'Terms and Conditions',
      name: 'terms_and_conditions_sign',
      desc: '',
      args: [],
    );
  }

  /// ` Create New Account`
  String get create_account {
    return Intl.message(
      ' Create New Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get already_have_account {
    return Intl.message(
      'Already have an account? ',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Activation link has been sent`
  String get activation_link {
    return Intl.message(
      'Activation link has been sent',
      name: 'activation_link',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email to activate your account`
  String get please_check_email {
    return Intl.message(
      'Please check your email to activate your account',
      name: 'please_check_email',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get phone_number_validation {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'phone_number_validation',
      desc: '',
      args: [],
    );
  }

  /// `You need to accept the terms and conditions`
  String get needs_to_accept_terms {
    return Intl.message(
      'You need to accept the terms and conditions',
      name: 'needs_to_accept_terms',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Products`
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get cart {
    return Intl.message(
      'Shopping Cart',
      name: 'cart',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get profile {
    return Intl.message(
      'My Account',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Welcome!`
  String get welcome {
    return Intl.message(
      'Welcome!',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Best Selling`
  String get best_selling {
    return Intl.message(
      'Best Selling',
      name: 'best_selling',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get results {
    return Intl.message(
      'Results',
      name: 'results',
      desc: '',
      args: [],
    );
  }

  /// `Search for`
  String get search_for {
    return Intl.message(
      'Search for',
      name: 'search_for',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Order`
  String get confirm_order {
    return Intl.message(
      'Confirm Order',
      name: 'confirm_order',
      desc: '',
      args: [],
    );
  }

  /// `EGP`
  String get pound {
    return Intl.message(
      'EGP',
      name: 'pound',
      desc: '',
      args: [],
    );
  }

  /// `Quantity : `
  String get quantity {
    return Intl.message(
      'Quantity : ',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `You have {count} products in the shopping cart`
  String cart_products_count(Object count) {
    return Intl.message(
      'You have $count products in the shopping cart',
      name: 'cart_products_count',
      desc: '',
      args: [count],
    );
  }

  /// `Remove Product`
  String get delete_product {
    return Intl.message(
      'Remove Product',
      name: 'delete_product',
      desc: '',
      args: [],
    );
  }

  /// `Cartons`
  String get carton {
    return Intl.message(
      'Cartons',
      name: 'carton',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get payment_method {
    return Intl.message(
      'Payment Method',
      name: 'payment_method',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Review Order`
  String get review_order {
    return Intl.message(
      'Review Order',
      name: 'review_order',
      desc: '',
      args: [],
    );
  }

  /// `Cash on Delivery`
  String get cash_on_delivery {
    return Intl.message(
      'Cash on Delivery',
      name: 'cash_on_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Deliver to Selected Address`
  String get deliver_in_selected_address {
    return Intl.message(
      'Deliver to Selected Address',
      name: 'deliver_in_selected_address',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `You must fill in all the required data`
  String get fill_all_data {
    return Intl.message(
      'You must fill in all the required data',
      name: 'fill_all_data',
      desc: '',
      args: [],
    );
  }

  /// `➕ Add New Address`
  String get add_new_address {
    return Intl.message(
      '➕ Add New Address',
      name: 'add_new_address',
      desc: '',
      args: [],
    );
  }

  /// `✅ Use Default Address`
  String get use_default_address {
    return Intl.message(
      '✅ Use Default Address',
      name: 'use_default_address',
      desc: '',
      args: [],
    );
  }

  /// `Governorate`
  String get government_hint {
    return Intl.message(
      'Governorate',
      name: 'government_hint',
      desc: '',
      args: [],
    );
  }

  /// `City or Village`
  String get city_hint {
    return Intl.message(
      'City or Village',
      name: 'city_hint',
      desc: '',
      args: [],
    );
  }

  /// `Street Name`
  String get street_hint {
    return Intl.message(
      'Street Name',
      name: 'street_hint',
      desc: '',
      args: [],
    );
  }

  /// `Address description (Optional)`
  String get address_description_hint {
    return Intl.message(
      'Address description (Optional)',
      name: 'address_description_hint',
      desc: '',
      args: [],
    );
  }

  /// `Order Summary:`
  String get order_summary {
    return Intl.message(
      'Order Summary:',
      name: 'order_summary',
      desc: '',
      args: [],
    );
  }

  /// `Total Amount`
  String get total_amount {
    return Intl.message(
      'Total Amount',
      name: 'total_amount',
      desc: '',
      args: [],
    );
  }

  /// `Delivery`
  String get delivery {
    return Intl.message(
      'Delivery',
      name: 'delivery',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get free {
    return Intl.message(
      'Free',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Total Order`
  String get total_order {
    return Intl.message(
      'Total Order',
      name: 'total_order',
      desc: '',
      args: [],
    );
  }

  /// `Discount`
  String get discount {
    return Intl.message(
      'Discount',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Amount After Discount`
  String get amount_after_discount {
    return Intl.message(
      'Amount After Discount',
      name: 'amount_after_discount',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Available Points:`
  String get available_points {
    return Intl.message(
      'Available Points:',
      name: 'available_points',
      desc: '',
      args: [],
    );
  }

  /// `Redeem`
  String get redeem {
    return Intl.message(
      'Redeem',
      name: 'redeem',
      desc: '',
      args: [],
    );
  }

  /// `Redeemed`
  String get redeemed {
    return Intl.message(
      'Redeemed',
      name: 'redeemed',
      desc: '',
      args: [],
    );
  }

  /// `Not enough points to redeem`
  String get insufficient_points {
    return Intl.message(
      'Not enough points to redeem',
      name: 'insufficient_points',
      desc: '',
      args: [],
    );
  }

  /// `All available points have been used`
  String get points_used {
    return Intl.message(
      'All available points have been used',
      name: 'points_used',
      desc: '',
      args: [],
    );
  }

  /// `{discount} EGP has been deducted from points`
  String discount_applied(Object discount) {
    return Intl.message(
      '$discount EGP has been deducted from points',
      name: 'discount_applied',
      desc: '',
      args: [discount],
    );
  }

  /// `Not enough points to redeem\n Minimum required: 1000 points`
  String get min_points_required {
    return Intl.message(
      'Not enough points to redeem\n Minimum required: 1000 points',
      name: 'min_points_required',
      desc: '',
      args: [],
    );
  }

  /// `You can use {redeemable_amount} EGP as a discount`
  String redeemable_discount(Object redeemable_amount) {
    return Intl.message(
      'You can use $redeemable_amount EGP as a discount',
      name: 'redeemable_discount',
      desc: '',
      args: [redeemable_amount],
    );
  }

  /// `Discount`
  String get discount_title {
    return Intl.message(
      'Discount',
      name: 'discount_title',
      desc: '',
      args: [],
    );
  }

  /// `Order Confirmed Successfully`
  String get order_confirmed_successfully {
    return Intl.message(
      'Order Confirmed Successfully',
      name: 'order_confirmed_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Order Number: #{orderId}`
  String order_number(Object orderId) {
    return Intl.message(
      'Order Number: #$orderId',
      name: 'order_number',
      desc: '',
      args: [orderId],
    );
  }

  /// `Return to Home Page`
  String get return_to_home {
    return Intl.message(
      'Return to Home Page',
      name: 'return_to_home',
      desc: '',
      args: [],
    );
  }

  /// `My Account`
  String get my_account {
    return Intl.message(
      'My Account',
      name: 'my_account',
      desc: '',
      args: [],
    );
  }

  /// `Switch to English`
  String get switch_language {
    return Intl.message(
      'Switch to English',
      name: 'switch_language',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get personal_profile {
    return Intl.message(
      'Profile',
      name: 'personal_profile',
      desc: '',
      args: [],
    );
  }

  /// `Shipping Information`
  String get shipping_info {
    return Intl.message(
      'Shipping Information',
      name: 'shipping_info',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get my_orders {
    return Intl.message(
      'My Orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get help {
    return Intl.message(
      'Help',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms_conditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_conditions',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout {
    return Intl.message(
      'Log Out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get logout_confirmation {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'logout_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logout_title {
    return Intl.message(
      'Log Out',
      name: 'logout_title',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get delete_account {
    return Intl.message(
      'Delete Account',
      name: 'delete_account',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete your account?\n All your data will be deleted.`
  String get delete_confirmation {
    return Intl.message(
      'Are you sure you want to delete your account?\n All your data will be deleted.',
      name: 'delete_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get delete_title {
    return Intl.message(
      'Delete Account',
      name: 'delete_title',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `No products in the shopping cart`
  String get cart_empty_title {
    return Intl.message(
      'No products in the shopping cart',
      name: 'cart_empty_title',
      desc: '',
      args: [],
    );
  }

  /// `You can add products from the list`
  String get cart_empty_subtitle {
    return Intl.message(
      'You can add products from the list',
      name: 'cart_empty_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Product removed from the cart successfully`
  String get product_removed_success {
    return Intl.message(
      'Product removed from the cart successfully',
      name: 'product_removed_success',
      desc: '',
      args: [],
    );
  }

  /// `Product quantity updated successfully`
  String get product_quantity_updated_success {
    return Intl.message(
      'Product quantity updated successfully',
      name: 'product_quantity_updated_success',
      desc: '',
      args: [],
    );
  }

  /// `No data available to display`
  String get no_data_available {
    return Intl.message(
      'No data available to display',
      name: 'no_data_available',
      desc: '',
      args: [],
    );
  }

  /// `Data updated successfully`
  String get data_updated_success {
    return Intl.message(
      'Data updated successfully',
      name: 'data_updated_success',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information`
  String get personal_information {
    return Intl.message(
      'Personal Information',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get save_changes {
    return Intl.message(
      'Save Changes',
      name: 'save_changes',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get in_progress {
    return Intl.message(
      'In Progress',
      name: 'in_progress',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Confirmed`
  String get confirmed {
    return Intl.message(
      'Confirmed',
      name: 'confirmed',
      desc: '',
      args: [],
    );
  }

  /// `Out for Delivery`
  String get out_for_delivery {
    return Intl.message(
      'Out for Delivery',
      name: 'out_for_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Delivered or canceled orders will be automatically removed from the orders page within 48 hours.`
  String get delivered_or_canceled_orders_auto_delete {
    return Intl.message(
      'Delivered or canceled orders will be automatically removed from the orders page within 48 hours.',
      name: 'delivered_or_canceled_orders_auto_delete',
      desc: '',
      args: [],
    );
  }

  /// `No orders`
  String get no_orders {
    return Intl.message(
      'No orders',
      name: 'no_orders',
      desc: '',
      args: [],
    );
  }

  /// `Once you place an order, you can track its status here.`
  String get no_orders_subtitle {
    return Intl.message(
      'Once you place an order, you can track its status here.',
      name: 'no_orders_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Order Status`
  String get current_order_status {
    return Intl.message(
      'Order Status',
      name: 'current_order_status',
      desc: '',
      args: [],
    );
  }

  /// `Total Order Cost`
  String get total_order_cost {
    return Intl.message(
      'Total Order Cost',
      name: 'total_order_cost',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Order Date`
  String get order_date {
    return Intl.message(
      'Order Date',
      name: 'order_date',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Address`
  String get delivery_address {
    return Intl.message(
      'Delivery Address',
      name: 'delivery_address',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cash {
    return Intl.message(
      'Cash',
      name: 'cash',
      desc: '',
      args: [],
    );
  }

  /// `Items`
  String get order_items {
    return Intl.message(
      'Items',
      name: 'order_items',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Order`
  String get order_cancel {
    return Intl.message(
      'Cancel Order',
      name: 'order_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel the order? You can cancel as long as it has not been confirmed.`
  String get order_cancel_confirmation {
    return Intl.message(
      'Are you sure you want to cancel the order? You can cancel as long as it has not been confirmed.',
      name: 'order_cancel_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Gulf Arabian Company is a leading company in the ghee and oil industry, founded with the aim of providing high-quality products that meet the needs of families in the Arab region. Since our establishment, we have been striving to offer food products that meet the highest standards of quality and safety, making us the first choice for our customers in the ghee and oil industry.`
  String get about_company {
    return Intl.message(
      'Gulf Arabian Company is a leading company in the ghee and oil industry, founded with the aim of providing high-quality products that meet the needs of families in the Arab region. Since our establishment, we have been striving to offer food products that meet the highest standards of quality and safety, making us the first choice for our customers in the ghee and oil industry.',
      name: 'about_company',
      desc: '',
      args: [],
    );
  }

  /// `Our Vision`
  String get our_vision {
    return Intl.message(
      'Our Vision',
      name: 'our_vision',
      desc: '',
      args: [],
    );
  }

  /// `To become the leading company in the ghee and oil industry in the Arab region, offering our customers innovative, healthy, and safe products while maintaining the highest quality standards.`
  String get vision_content {
    return Intl.message(
      'To become the leading company in the ghee and oil industry in the Arab region, offering our customers innovative, healthy, and safe products while maintaining the highest quality standards.',
      name: 'vision_content',
      desc: '',
      args: [],
    );
  }

  /// `Our Mission`
  String get our_mission {
    return Intl.message(
      'Our Mission',
      name: 'our_mission',
      desc: '',
      args: [],
    );
  }

  /// `Our mission is to provide high-quality ghee and oil products that combine great taste with health benefits. We focus on achieving sustainability in our operations and aim to offer products that help our customers achieve a healthy and balanced life.`
  String get mission_content {
    return Intl.message(
      'Our mission is to provide high-quality ghee and oil products that combine great taste with health benefits. We focus on achieving sustainability in our operations and aim to offer products that help our customers achieve a healthy and balanced life.',
      name: 'mission_content',
      desc: '',
      args: [],
    );
  }

  /// `Our Values`
  String get our_values {
    return Intl.message(
      'Our Values',
      name: 'our_values',
      desc: '',
      args: [],
    );
  }

  /// `- **Quality**: We are committed to providing high-quality ghee and oil with global standards.\n- **Innovation**: We continuously develop and improve our products to meet customer needs.\n- **Integrity**: We believe in the importance of integrity in all our internal and external dealings.\n- **Sustainability**: We work to reduce environmental impact and promote sustainability in our operations.`
  String get values_content {
    return Intl.message(
      '- **Quality**: We are committed to providing high-quality ghee and oil with global standards.\n- **Innovation**: We continuously develop and improve our products to meet customer needs.\n- **Integrity**: We believe in the importance of integrity in all our internal and external dealings.\n- **Sustainability**: We work to reduce environmental impact and promote sustainability in our operations.',
      name: 'values_content',
      desc: '',
      args: [],
    );
  }

  /// `What We Offer`
  String get what_we_offer {
    return Intl.message(
      'What We Offer',
      name: 'what_we_offer',
      desc: '',
      args: [],
    );
  }

  /// `We provide a wide range of products including:\n- **Vegetable Ghee**: Great-tasting, high-quality ghee.\n- **Cooking Oils**: A variety of oils such as sunflower oil, olive oil, and corn oil.`
  String get offer_content {
    return Intl.message(
      'We provide a wide range of products including:\n- **Vegetable Ghee**: Great-tasting, high-quality ghee.\n- **Cooking Oils**: A variety of oils such as sunflower oil, olive oil, and corn oil.',
      name: 'offer_content',
      desc: '',
      args: [],
    );
  }

  /// `Our Team`
  String get our_team {
    return Intl.message(
      'Our Team',
      name: 'our_team',
      desc: '',
      args: [],
    );
  }

  /// `Our team consists of experts and specialists in the ghee and oil industry, who work hard to ensure that we provide products that meet the expectations of our customers across the region.`
  String get team_content {
    return Intl.message(
      'Our team consists of experts and specialists in the ghee and oil industry, who work hard to ensure that we provide products that meet the expectations of our customers across the region.',
      name: 'team_content',
      desc: '',
      args: [],
    );
  }

  /// `Our Achievements`
  String get our_achievements {
    return Intl.message(
      'Our Achievements',
      name: 'our_achievements',
      desc: '',
      args: [],
    );
  }

  /// `Since the company's founding, we have achieved numerous successes, including:\n- **Quality Awards**: We have received many awards in recognition of our commitment to quality.\n- **International Certifications**: We hold recognized certifications in the ghee and oil industry.`
  String get achievements_content {
    return Intl.message(
      'Since the company\'s founding, we have achieved numerous successes, including:\n- **Quality Awards**: We have received many awards in recognition of our commitment to quality.\n- **International Certifications**: We hold recognized certifications in the ghee and oil industry.',
      name: 'achievements_content',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `For any inquiries or complaints, please contact us via:\n- **Phone**:\n 01140550072 \n 01028607331\n 0196817723\n- **Email**:\n Gulf-arabian2015@outlook.com \n gulfarabiancompany650@gmail.com\n- **Address**: Plot No. 5 - Industrial Zone - Robiki - Badr City`
  String get contact_content {
    return Intl.message(
      'For any inquiries or complaints, please contact us via:\n- **Phone**:\n 01140550072 \n 01028607331\n 0196817723\n- **Email**:\n Gulf-arabian2015@outlook.com \n gulfarabiancompany650@gmail.com\n- **Address**: Plot No. 5 - Industrial Zone - Robiki - Badr City',
      name: 'contact_content',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `1. Acceptance of Terms`
  String get acceptance_of_terms {
    return Intl.message(
      '1. Acceptance of Terms',
      name: 'acceptance_of_terms',
      desc: '',
      args: [],
    );
  }

  /// `By using this app, you agree to be bound by these terms and conditions. If you do not agree with any of these terms, please stop using the app.`
  String get acceptance_of_terms_content {
    return Intl.message(
      'By using this app, you agree to be bound by these terms and conditions. If you do not agree with any of these terms, please stop using the app.',
      name: 'acceptance_of_terms_content',
      desc: '',
      args: [],
    );
  }

  /// `2. Company Information`
  String get company_information {
    return Intl.message(
      '2. Company Information',
      name: 'company_information',
      desc: '',
      args: [],
    );
  }

  /// `The app belongs to Gulf Arabian Company, an Egyptian company specializing in food manufacturing (oil and ghee). The company is based in Egypt and has a distribution network across the Middle East.`
  String get company_information_content {
    return Intl.message(
      'The app belongs to Gulf Arabian Company, an Egyptian company specializing in food manufacturing (oil and ghee). The company is based in Egypt and has a distribution network across the Middle East.',
      name: 'company_information_content',
      desc: '',
      args: [],
    );
  }

  /// `3. User Registration`
  String get user_registration {
    return Intl.message(
      '3. User Registration',
      name: 'user_registration',
      desc: '',
      args: [],
    );
  }

  /// `To benefit from the app's services, you must register an account using your full name, email address, phone number, and residential address. You can also log in using your Google or Facebook account.`
  String get user_registration_content {
    return Intl.message(
      'To benefit from the app\'s services, you must register an account using your full name, email address, phone number, and residential address. You can also log in using your Google or Facebook account.',
      name: 'user_registration_content',
      desc: '',
      args: [],
    );
  }

  /// `4. Points Collection and Usage`
  String get points_collection_usage {
    return Intl.message(
      '4. Points Collection and Usage',
      name: 'points_collection_usage',
      desc: '',
      args: [],
    );
  }

  /// `When purchasing products from the app, users earn points based on the value of purchased products. These points can be used for discounts on future purchases.\n\n- **How to Earn Points**: Users earn 1 point for every 1 EGP spent on products in the app.\n- **How to Use Points**: Users can redeem points for discounts on future purchases, with 20 EGP granted for every 1000 points.\n\nThe minimum points required to redeem is 1000.\n\nPlease note that points cannot be redeemed for cash and remain valid for a limited period as per company policy.\n\nIf an order is canceled, the earned points from that order will be deducted from the balance.`
  String get points_collection_usage_content {
    return Intl.message(
      'When purchasing products from the app, users earn points based on the value of purchased products. These points can be used for discounts on future purchases.\n\n- **How to Earn Points**: Users earn 1 point for every 1 EGP spent on products in the app.\n- **How to Use Points**: Users can redeem points for discounts on future purchases, with 20 EGP granted for every 1000 points.\n\nThe minimum points required to redeem is 1000.\n\nPlease note that points cannot be redeemed for cash and remain valid for a limited period as per company policy.\n\nIf an order is canceled, the earned points from that order will be deducted from the balance.',
      name: 'points_collection_usage_content',
      desc: '',
      args: [],
    );
  }

  /// `5. Data Collection and Usage`
  String get data_collection_usage {
    return Intl.message(
      '5. Data Collection and Usage',
      name: 'data_collection_usage',
      desc: '',
      args: [],
    );
  }

  /// `We collect personal data to provide better services, such as product ordering and delivery. Your data is handled securely according to our privacy policy.`
  String get data_collection_usage_content {
    return Intl.message(
      'We collect personal data to provide better services, such as product ordering and delivery. Your data is handled securely according to our privacy policy.',
      name: 'data_collection_usage_content',
      desc: '',
      args: [],
    );
  }

  /// `6. App Usage`
  String get app_usage {
    return Intl.message(
      '6. App Usage',
      name: 'app_usage',
      desc: '',
      args: [],
    );
  }

  /// `The app allows users to view the latest prices of the company's products, place orders, and pay upon delivery. Users can track orders and update their account details.`
  String get app_usage_content {
    return Intl.message(
      'The app allows users to view the latest prices of the company\'s products, place orders, and pay upon delivery. Users can track orders and update their account details.',
      name: 'app_usage_content',
      desc: '',
      args: [],
    );
  }

  /// `7. Cash on Delivery`
  String get cash_on_delivery_term {
    return Intl.message(
      '7. Cash on Delivery',
      name: 'cash_on_delivery_term',
      desc: '',
      args: [],
    );
  }

  /// `The only payment method currently available is cash on delivery. Users must provide accurate information to ensure successful order delivery.`
  String get cash_on_delivery_content {
    return Intl.message(
      'The only payment method currently available is cash on delivery. Users must provide accurate information to ensure successful order delivery.',
      name: 'cash_on_delivery_content',
      desc: '',
      args: [],
    );
  }

  /// `8. Data Update`
  String get data_update {
    return Intl.message(
      '8. Data Update',
      name: 'data_update',
      desc: '',
      args: [],
    );
  }

  /// `Users are responsible for updating their personal details, such as address and phone number, to ensure proper order delivery.`
  String get data_update_content {
    return Intl.message(
      'Users are responsible for updating their personal details, such as address and phone number, to ensure proper order delivery.',
      name: 'data_update_content',
      desc: '',
      args: [],
    );
  }

  /// `9. Order Cancellation`
  String get order_cancellation {
    return Intl.message(
      '9. Order Cancellation',
      name: 'order_cancellation',
      desc: '',
      args: [],
    );
  }

  /// `Users can cancel orders before they are confirmed by the team. If canceled after confirmation, the app reserves the right to take appropriate action.`
  String get order_cancellation_content {
    return Intl.message(
      'Users can cancel orders before they are confirmed by the team. If canceled after confirmation, the app reserves the right to take appropriate action.',
      name: 'order_cancellation_content',
      desc: '',
      args: [],
    );
  }

  /// `10. Intellectual Property Rights`
  String get intellectual_property_rights {
    return Intl.message(
      '10. Intellectual Property Rights',
      name: 'intellectual_property_rights',
      desc: '',
      args: [],
    );
  }

  /// `All content in the app, including text, images, and logos, belongs to Gulf Arabian Company and is protected by intellectual property laws. Unauthorized copying or reuse is prohibited.`
  String get intellectual_property_rights_content {
    return Intl.message(
      'All content in the app, including text, images, and logos, belongs to Gulf Arabian Company and is protected by intellectual property laws. Unauthorized copying or reuse is prohibited.',
      name: 'intellectual_property_rights_content',
      desc: '',
      args: [],
    );
  }

  /// `11. Liability Limitations`
  String get liability_limitations {
    return Intl.message(
      '11. Liability Limitations',
      name: 'liability_limitations',
      desc: '',
      args: [],
    );
  }

  /// `The app is provided as-is, without warranties of any kind. The company is not liable for any damages or losses resulting from the use or reliance on the app's services or content.`
  String get liability_limitations_content {
    return Intl.message(
      'The app is provided as-is, without warranties of any kind. The company is not liable for any damages or losses resulting from the use or reliance on the app\'s services or content.',
      name: 'liability_limitations_content',
      desc: '',
      args: [],
    );
  }

  /// `12. Terms and Conditions Modifications`
  String get terms_modifications {
    return Intl.message(
      '12. Terms and Conditions Modifications',
      name: 'terms_modifications',
      desc: '',
      args: [],
    );
  }

  /// `The Company reserves the right to modify these Terms and Conditions at any time. Users will be notified of any changes by updating the effective date at the top of this page. Your continued use of the Application after such modifications constitutes your acceptance of the modified Terms.`
  String get terms_modifications_content {
    return Intl.message(
      'The Company reserves the right to modify these Terms and Conditions at any time. Users will be notified of any changes by updating the effective date at the top of this page. Your continued use of the Application after such modifications constitutes your acceptance of the modified Terms.',
      name: 'terms_modifications_content',
      desc: '',
      args: [],
    );
  }

  /// `13. Applicable Laws`
  String get applicable_laws {
    return Intl.message(
      '13. Applicable Laws',
      name: 'applicable_laws',
      desc: '',
      args: [],
    );
  }

  /// `These Terms and Conditions are governed by Egyptian laws and are subject to any disputes that may arise. Any dispute will be resolved in Egyptian courts.`
  String get applicable_laws_content {
    return Intl.message(
      'These Terms and Conditions are governed by Egyptian laws and are subject to any disputes that may arise. Any dispute will be resolved in Egyptian courts.',
      name: 'applicable_laws_content',
      desc: '',
      args: [],
    );
  }

  /// `14. Contact Information`
  String get contact_information {
    return Intl.message(
      '14. Contact Information',
      name: 'contact_information',
      desc: '',
      args: [],
    );
  }

  /// `contact_information_content: For any inquiries or complaints, please contact us via:\n- Phone:\n01140550072\n01028607331\n0196817723\n- Email:\nGulf-arabian2015@outlook.com\ngulfarabiancompany650@gmail.com\n- Address: Plot No. 5 - Industrial Area - Badr City`
  String get contact_information_content {
    return Intl.message(
      'contact_information_content: For any inquiries or complaints, please contact us via:\n- Phone:\n01140550072\n01028607331\n0196817723\n- Email:\nGulf-arabian2015@outlook.com\ngulfarabiancompany650@gmail.com\n- Address: Plot No. 5 - Industrial Area - Badr City',
      name: 'contact_information_content',
      desc: '',
      args: [],
    );
  }

  /// `Agree`
  String get agree {
    return Intl.message(
      'Agree',
      name: 'agree',
      desc: '',
      args: [],
    );
  }

  /// `Product Description`
  String get product_description {
    return Intl.message(
      'Product Description',
      name: 'product_description',
      desc: '',
      args: [],
    );
  }

  /// `Organic`
  String get organic {
    return Intl.message(
      'Organic',
      name: 'organic',
      desc: '',
      args: [],
    );
  }

  /// `Expiry`
  String get expiry {
    return Intl.message(
      'Expiry',
      name: 'expiry',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Various products of: `
  String get various_products {
    return Intl.message(
      'Various products of: ',
      name: 'various_products',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get add_to_cart {
    return Intl.message(
      'Add to cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `The product has been added to the cart successfully.`
  String get product_added_success {
    return Intl.message(
      'The product has been added to the cart successfully.',
      name: 'product_added_success',
      desc: '',
      args: [],
    );
  }

  /// `The product quantity has been updated successfully.`
  String get product_quantity_updated {
    return Intl.message(
      'The product quantity has been updated successfully.',
      name: 'product_quantity_updated',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `A reset password message has been sent to you.`
  String get reset_password_message {
    return Intl.message(
      'A reset password message has been sent to you.',
      name: 'reset_password_message',
      desc: '',
      args: [],
    );
  }

  /// `The order has been added successfully.`
  String get order_added_success {
    return Intl.message(
      'The order has been added successfully.',
      name: 'order_added_success',
      desc: '',
      args: [],
    );
  }

  /// `Data has been saved successfully.`
  String get data_saved_success {
    return Intl.message(
      'Data has been saved successfully.',
      name: 'data_saved_success',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while saving the data.`
  String get data_save_error {
    return Intl.message(
      'An error occurred while saving the data.',
      name: 'data_save_error',
      desc: '',
      args: [],
    );
  }

  /// `The order has been canceled successfully.`
  String get order_canceled_success {
    return Intl.message(
      'The order has been canceled successfully.',
      name: 'order_canceled_success',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred while canceling the order.`
  String get order_cancel_error {
    return Intl.message(
      'An error occurred while canceling the order.',
      name: 'order_cancel_error',
      desc: '',
      args: [],
    );
  }

  /// `Weak password`
  String get weak_password {
    return Intl.message(
      'Weak password',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `This email is already in use`
  String get email_already_in_use {
    return Intl.message(
      'This email is already in use',
      name: 'email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `This email is not registered`
  String get user_not_found {
    return Intl.message(
      'This email is not registered',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password`
  String get wrong_password {
    return Intl.message(
      'Incorrect password',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Check your credentials`
  String get invalid_credential {
    return Intl.message(
      'Check your credentials',
      name: 'invalid_credential',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalid_email {
    return Intl.message(
      'Invalid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Your account has not been activated`
  String get operation_not_allowed {
    return Intl.message(
      'Your account has not been activated',
      name: 'operation_not_allowed',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been disabled`
  String get user_disabled {
    return Intl.message(
      'Your account has been disabled',
      name: 'user_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection`
  String get network_request_failed {
    return Intl.message(
      'Check your internet connection',
      name: 'network_request_failed',
      desc: '',
      args: [],
    );
  }

  /// `This account is linked to a different provider. Try logging in using another method`
  String get account_exists_with_different_credential {
    return Intl.message(
      'This account is linked to a different provider. Try logging in using another method',
      name: 'account_exists_with_different_credential',
      desc: '',
      args: [],
    );
  }

  /// `Invalid verification code`
  String get invalid_verification_code {
    return Intl.message(
      'Invalid verification code',
      name: 'invalid_verification_code',
      desc: '',
      args: [],
    );
  }

  /// `Invalid verification ID`
  String get invalid_verification_id {
    return Intl.message(
      'Invalid verification ID',
      name: 'invalid_verification_id',
      desc: '',
      args: [],
    );
  }

  /// `These credentials are already used by a different account`
  String get credential_already_in_use {
    return Intl.message(
      'These credentials are already used by a different account',
      name: 'credential_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `The operation took too long. Try again`
  String get timeout {
    return Intl.message(
      'The operation took too long. Try again',
      name: 'timeout',
      desc: '',
      args: [],
    );
  }

  /// `Login window was closed before completing the process`
  String get popup_closed_by_user {
    return Intl.message(
      'Login window was closed before completing the process',
      name: 'popup_closed_by_user',
      desc: '',
      args: [],
    );
  }

  /// `Request limit exceeded. Try again later`
  String get quota_exceeded {
    return Intl.message(
      'Request limit exceeded. Try again later',
      name: 'quota_exceeded',
      desc: '',
      args: [],
    );
  }

  /// `Sign-in was canceled`
  String get sign_in_canceled {
    return Intl.message(
      'Sign-in was canceled',
      name: 'sign_in_canceled',
      desc: '',
      args: [],
    );
  }

  /// `Access to your Facebook account was denied. Check permissions`
  String get access_denied {
    return Intl.message(
      'Access to your Facebook account was denied. Check permissions',
      name: 'access_denied',
      desc: '',
      args: [],
    );
  }

  /// `Invalid or expired Facebook access token`
  String get invalid_access_token {
    return Intl.message(
      'Invalid or expired Facebook access token',
      name: 'invalid_access_token',
      desc: '',
      args: [],
    );
  }

  /// `Facebook login failed. Try again`
  String get facebook_login_failed {
    return Intl.message(
      'Facebook login failed. Try again',
      name: 'facebook_login_failed',
      desc: '',
      args: [],
    );
  }

  /// `Facebook login was canceled`
  String get cancelled_facebook_login {
    return Intl.message(
      'Facebook login was canceled',
      name: 'cancelled_facebook_login',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred, please try again`
  String get default_error_message {
    return Intl.message(
      'An error occurred, please try again',
      name: 'default_error_message',
      desc: '',
      args: [],
    );
  }

  /// `To delete the account, you must confirm the password`
  String get delete_button_title {
    return Intl.message(
      'To delete the account, you must confirm the password',
      name: 'delete_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Password verification`
  String get password_verification_text {
    return Intl.message(
      'Password verification',
      name: 'password_verification_text',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `verification in progress`
  String get password_verification_processing {
    return Intl.message(
      'verification in progress',
      name: 'password_verification_processing',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error_dialog_title {
    return Intl.message(
      'Error',
      name: 'error_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `The password is incorrect, please try again.`
  String get password_is_incorrect {
    return Intl.message(
      'The password is incorrect, please try again.',
      name: 'password_is_incorrect',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get ok {
    return Intl.message(
      'Confirm',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `there is no products`
  String get there_is_no_products {
    return Intl.message(
      'there is no products',
      name: 'there_is_no_products',
      desc: '',
      args: [],
    );
  }

  /// `new products will be added soon`
  String get new_products_will_be_added {
    return Intl.message(
      'new products will be added soon',
      name: 'new_products_will_be_added',
      desc: '',
      args: [],
    );
  }

  /// `Shop inside {productType} products`
  String shopInsideProducts(Object productType) {
    return Intl.message(
      'Shop inside $productType products',
      name: 'shopInsideProducts',
      desc: '',
      args: [productType],
    );
  }

  /// `Ghee`
  String get ghee {
    return Intl.message(
      'Ghee',
      name: 'ghee',
      desc: '',
      args: [],
    );
  }

  /// `Oils`
  String get oils {
    return Intl.message(
      'Oils',
      name: 'oils',
      desc: '',
      args: [],
    );
  }

  /// `Industrial`
  String get industrial {
    return Intl.message(
      'Industrial',
      name: 'industrial',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
