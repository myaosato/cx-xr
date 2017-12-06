#|
  This file is a part of cx-xr project.
  Copyright (c) 2017 Satoaki Miyao (tetu60u@yahoo.co.jp)
|#

#|
  generate cx-xr funcitons like cdar

  Author: Satoaki Miyao (tetu60u@yahoo.co.jp)
|#

(defsystem "cx-xr"
  :version "0.1.0"
  :author "Satoaki Miyao"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "cx-xr"))))
  :description "generate cx-xr funcitons like cdar"
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown")))
