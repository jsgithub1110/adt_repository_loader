adt_repository_loader
=====================

This is adt repository loader which transforms download repository xml file to readable html tables with XSLT.

The transform.xsl file is fully functionable.

All you have to do is:
 1. Download repository xml file. (i.e http://dl-ssl.google.com/android/repository/repository-8.xml)
 2. Insert following two lines at the head of the xml file.
      <?xml version="1.0" encoding="UTF-8"?>
      <?xml-stylesheet type="text/xsl" href="transform1.xsl"?>
 3. Now open the xml file in the browser.

You can give your styles to the table.
