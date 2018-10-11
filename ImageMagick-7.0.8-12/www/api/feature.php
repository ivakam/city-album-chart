



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" >
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" >
  <title>MagickCore, C API: Image Features @ ImageMagick</title>
  <meta name="application-name" content="ImageMagick">
  <meta name="description" content="Use ImageMagick® to create, edit, compose, convert bitmap images. With ImageMagick you can resize your image, crop it, change its shades and colors, add captions, among other operations.">
  <meta name="application-url" content="https://www.imagemagick.org">
  <meta name="generator" content="PHP">
  <meta name="keywords" content="magickcore, c, api:, image, features, ImageMagick, PerlMagick, image processing, image, photo, software, Magick++, OpenMP, convert">
  <meta name="rating" content="GENERAL">
  <meta name="robots" content="INDEX, FOLLOW">
  <meta name="generator" content="ImageMagick Studio LLC">
  <meta name="author" content="ImageMagick Studio LLC">
  <meta name="revisit-after" content="2 DAYS">
  <meta name="resource-type" content="document">
  <meta name="copyright" content="Copyright (c) 1999-2017 ImageMagick Studio LLC">
  <meta name="distribution" content="Global">
  <meta name="magick-serial" content="P131-S030410-R485315270133-P82224-A6668-G1245-1">
  <meta name="google-site-verification" content="_bMOCDpkx9ZAzBwb2kF3PRHbfUUdFj2uO8Jd1AXArz4">
  <link href="https://www.imagemagick.org/api/feature.php" rel="canonical">
  <link href="https://imagemagick.org/image/wand.png" rel="icon">
  <link href="https://imagemagick.org/image/wand.ico" rel="shortcut icon">
  <link href="https://imagemagick.org/assets/magick-css.php" rel="stylesheet">
</head>
<body>
  <header>
  <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="https://imagemagick.org/"><img class="d-block" id="icon" alt="ImageMagick" width="32" height="32" src="https://imagemagick.org/image/wand.ico"/></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="navbar-collapse collapse" id="navbarsExampleDefault" style="">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href="https://imagemagick.org/index.php">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="https://imagemagick.org/script/download.php">Download</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="https://imagemagick.org/script/command-line-tools.php">Tools</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="https://imagemagick.org/script/command-line-processing.php">Command-line</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="https://imagemagick.org/script/resources.php">Resources</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="https://imagemagick.org/script/develop.php">Develop</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" target="_blank" href="https://www.imagemagick.org/discourse-server/">Community</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="../script/search.php">
      <input class="form-control mr-sm-2" type="text" name="q" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit" name="sa">Search</button>
    </form>
    </div>
  </nav>
  <div class="container">
   <script async="async" src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>    <ins class="adsbygoogle"
         style="display:block"
         data-ad-client="ca-pub-3129977114552745"
         data-ad-slot="6345125851"
         data-ad-format="auto"></ins>
    <script>
      (adsbygoogle = window.adsbygoogle || []).push({});
    </script>

  </div>
  </header>
  <main class="container">
    <div class="magick-template">
<div class="magick-header">
<p class="text-center"><a href="feature.php#CannyEdgeImage">CannyEdgeImage</a> &bull; <a href="feature.php#GetImageFeatures">GetImageFeatures</a> &bull; <a href="feature.php#Use HoughLineImage">Use HoughLineImage</a> &bull; <a href="feature.php#MeanShiftImage">MeanShiftImage</a></p>

<h2><a href="http://www.imagemagick.org/api/MagickCore/feature_8c.html" id="CannyEdgeImage">CannyEdgeImage</a></h2>

<p>CannyEdgeImage() uses a multi-stage algorithm to detect a wide range of edges in images.</p>

<p>The format of the CannyEdgeImage method is:</p>

<pre class="text">
Image *CannyEdgeImage(const Image *image,const double radius,
  const double sigma,const double lower_percent,
  const double upper_percent,ExceptionInfo *exception)
</pre>

<p>A description of each parameter follows:</p>

<dd>
</dd>

<dd> </dd>
<dl class="dl-horizontal">
<dt>image</dt>
<dd>the image. </dd>

<dd> </dd>
<dt>radius</dt>
<dd>the radius of the gaussian smoothing filter. </dd>

<dd> </dd>
<dt>sigma</dt>
<dd>the sigma of the gaussian smoothing filter. </dd>

<dd> </dd>
<dt>lower_percent</dt>
<dd>percentage of edge pixels in the lower threshold. </dd>

<dd> </dd>
<dt>upper_percent</dt>
<dd>percentage of edge pixels in the upper threshold. </dd>

<dd> </dd>
<dt>exception</dt>
<dd>return any errors or warnings in this structure. </dd>

<dd>  </dd>
</dl>
<h2><a href="http://www.imagemagick.org/api/MagickCore/feature_8c.html" id="GetImageFeatures">GetImageFeatures</a></h2>

<p>GetImageFeatures() returns features for each channel in the image in each of four directions (horizontal, vertical, left and right diagonals) for the specified distance.  The features include the angular second moment, contrast, correlation, sum of squares: variance, inverse difference moment, sum average, sum varience, sum entropy, entropy, difference variance,  difference entropy, information measures of correlation 1, information measures of correlation 2, and maximum correlation coefficient.  You can access the red channel contrast, for example, like this:</p>

<pre class="text">
channel_features=GetImageFeatures(image,1,exception);
contrast=channel_features[RedPixelChannel].contrast[0];
</pre>

<p>Use MagickRelinquishMemory() to free the features buffer.</p>

<p>The format of the GetImageFeatures method is:</p>

<pre class="text">
ChannelFeatures *GetImageFeatures(const Image *image,
  const size_t distance,ExceptionInfo *exception)
</pre>

<p>A description of each parameter follows:</p>

<dd>
</dd>

<dd> </dd>
<dl class="dl-horizontal">
<dt>image</dt>
<dd>the image. </dd>

<dd> </dd>
<dt>distance</dt>
<dd>the distance. </dd>

<dd> </dd>
<dt>exception</dt>
<dd>return any errors or warnings in this structure. </dd>

<dd>  </dd>
</dl>
<h2><a href="http://www.imagemagick.org/api/MagickCore/feature_8c.html" id="Use_HoughLineImage">Use HoughLineImage</a></h2>

<p>Use HoughLineImage() in conjunction with any binary edge extracted image (we recommand Canny) to identify lines in the image.  The algorithm accumulates counts for every white pixel for every possible orientation (for angles from 0 to 179 in 1 degree increments) and distance from the center of the image to the corner (in 1 px increments) and stores the counts in an accumulator matrix of angle vs distance. The size of the accumulator is 180x(diagonal/2). Next it searches this space for peaks in counts and converts the locations of the peaks to slope and intercept in the normal x,y input image space. Use the slope/intercepts to find the endpoints clipped to the bounds of the image. The lines are then drawn. The counts are a measure of the length of the lines</p>

<p>The format of the HoughLineImage method is:</p>

<pre class="text">
Image *HoughLineImage(const Image *image,const size_t width,
  const size_t height,const size_t threshold,ExceptionInfo *exception)
</pre>

<p>A description of each parameter follows:</p>

<dd>
</dd>

<dd> </dd>
<dl class="dl-horizontal">
<dt>image</dt>
<dd>the image. </dd>

<dd> </dd>
<dt>width, height</dt>
<dd>find line pairs as local maxima in this neighborhood. </dd>

<dd> </dd>
<dt>threshold</dt>
<dd>the line count threshold. </dd>

<dd> </dd>
<dt>exception</dt>
<dd>return any errors or warnings in this structure. </dd>

<dd>  </dd>
</dl>
<h2><a href="http://www.imagemagick.org/api/MagickCore/feature_8c.html" id="MeanShiftImage">MeanShiftImage</a></h2>

<p>MeanShiftImage() delineate arbitrarily shaped clusters in the image. For each pixel, it visits all the pixels in the neighborhood specified by the window centered at the pixel and excludes those that are outside the radius=(window-1)/2 surrounding the pixel. From those pixels, it finds those that are within the specified color distance from the current mean, and computes a new x,y centroid from those coordinates and a new mean. This new x,y centroid is used as the center for a new window. This process iterates until it converges and the final mean is replaces the (original window center) pixel value. It repeats this process for the next pixel, etc., until it processes all pixels in the image. Results are typically better with colorspaces other than sRGB. We recommend YIQ, YUV or YCbCr.</p>

<p>The format of the MeanShiftImage method is:</p>

<pre class="text">
Image *MeanShiftImage(const Image *image,const size_t width,
  const size_t height,const double color_distance,
  ExceptionInfo *exception)
</pre>

<p>A description of each parameter follows:</p>

<dd>
</dd>

<dd> </dd>
<dl class="dl-horizontal">
<dt>image</dt>
<dd>the image. </dd>

<dd> </dd>
<dt>width, height</dt>
<dd>find pixels in this neighborhood. </dd>

<dd> </dd>
<dt>color_distance</dt>
<dd>the color distance. </dd>

<dd> </dd>
<dt>exception</dt>
<dd>return any errors or warnings in this structure. </dd>

<dd>  </dd>
</dl>
</div>
    </div>
  </main><!-- /.container -->
  <footer class="magick-footer">
    <p><a href="https://imagemagick.org/script/security-policy.php">Security</a> •
    <a href="https://imagemagick.org/script/architecture.php">Architecture</a> •
    <a href="https://imagemagick.org/script/links.php">Related</a> •
     <a href="https://imagemagick.org/script/sitemap.php">Sitemap</a>
    &nbsp; &nbsp;
    <a href="feature.php#"><img class="d-inline" id="wand" alt="And Now a Touch of Magick" width="16" height="16" src="https://imagemagick.org/image/wand.ico"/></a>
    &nbsp; &nbsp;
    <a href="http://pgp.mit.edu/pks/lookup?op=get&amp;search=0x89AB63D48277377A">Public Key</a> •
    <a href="https://imagemagick.org/script/support.php">Donate</a> •
    <a href="https://imagemagick.org/script/contact.php">Contact Us</a>
    <br/>
        <small>© 1999-2018 ImageMagick Studio LLC</small></p>
  </footer>

  <!-- Javascript assets -->
  <script src="https://imagemagick.org/assets/magick-js.php" crossorigin="anonymous"></script>
  <script>window.jQuery || document.write('<script src="https://imagemagick.org/assets/jquery.min.js"><\/script>')</script>
</body>
</html>
<!-- Magick Cache 5th September 2018 23:33 -->