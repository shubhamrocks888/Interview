class CouponRedemptionService
  def initialize(user:, coupon_code:)
    @user = user
    @coupon_code = coupon_code
  endd

  def call
    coupon = Coupon.find_by(code: @coupon_code)
    raise "Coupon not found" unless coupon
    raise "Coupon not usable" unless coupon.usable?
    raise "Coupon already redeemed" if CouponRedemption.exists?(user: @user, coupon: coupon)

    coupon.with_lock do
      redemption = CouponRedemption.create!(user: @user, coupon: coupon, redeemed_at: Time.current)
      # usage_count increment handled in CouponRedemption after_create callback
      redemption
    end
  end
end
