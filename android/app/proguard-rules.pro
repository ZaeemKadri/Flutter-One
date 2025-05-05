# Keep annotation classes
-keep class javax.annotation.Nullable
-keep class javax.annotation.** { *; }

# Keep Conscrypt security provider
-keep class org.conscrypt.** { *; }

# For OkHttp (optional but safe)
-dontwarn okhttp3.**
-keep class okhttp3.** { *; }

# If needed, keep PDFTron or related dependencies intact
-keep class com.pdftron.** { *; }
-dontwarn com.pdftron.**
