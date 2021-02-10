//HMAC Sample Code

String nonce = UUID.randomUUID().toString();

import java.util.UUID;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.HmacUtils;

public final class HmacSignature {

    private HmacSignature(){}

    public static String encrypt(final String keys, final String data) {
        return toBase64String(HmacUtils.getHmacSha256(keys.getBytes()).doFinal(data.getBytes()));
    }

    public static String toBase64String(byte[] bytes) {
        byte[] byteArray = Base64.encodeBase64(bytes);
        return new String(byteArray);
    }

    public static void main(String[] args) {
        
        CheckoutPaymentRequestForm form = new CheckoutPaymentRequestForm();

        form.setAmount(new BigDecimal("100"));
        form.setCurrency("JPY");
        form.setOrderId("merchant_order_id");

        ProductPackageForm productPackageForm = new ProductPackageForm();
        productPackageForm.setId("package_id");
        productPackageForm.setName("shop_name");
        productPackageForm.setAmount(new BigDecimal("100"));

        ProductForm productForm = new ProductForm();
        productForm.setId("product_id");
        productForm.setName("product_name");
        productForm.setImageUrl("");
        productForm.setQuantity(new BigDecimal("10"));
        productForm.setPrice(new BigDecimal("10"));
        productPackageForm.setProducts(Lists.newArrayList(productForm));

        form.setPackages(Lists.newArrayList(productPackageForm));
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setAppPackageName("");
        redirectUrls.setConfirmUrl("");
        form.setRedirectUrls(redirectUrls);

        String ChannelSecret = "a917ab6a2367b536f8e5a6e2977e06f4";
        String requestUri = "/v3/payments/request";
        String nonce = UUID.randomUUID().toString();
        String signature = encrypt(ChannelSecret, ChannelSecret + requestUri + toJson(form) + nonce);
    }
}