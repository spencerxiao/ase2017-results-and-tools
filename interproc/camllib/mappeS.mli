(** Mappe specialized for keys of type string *)

include (Mappe.S with type key=string and module Setkey=SetteS)
