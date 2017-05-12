(* File generated from disjunction.idl *)


(** Disjunctions of APRON abstract values *)

type 'a t

external ap_disjunction_manager_alloc : Manager.ap_manager_ptr -> Manager.ap_manager_ptr
	= "camlidl_disjunction_ap_disjunction_manager_alloc"

external ap_disjunction_manager_decompose : Manager.ap_manager_ptr -> Manager.ap_manager_ptr
	= "camlidl_disjunction_ap_disjunction_manager_decompose"

external ap_disjunction_to_lincons0_set : Manager.ap_manager_ptr -> Abstract0.ap_abstract0_ptr -> Lincons0.ap_lincons0_array_t
	= "camlidl_disjunction_ap_disjunction_to_lincons0_set"

val to_lincons1_set : 'a t Manager.t -> 'a t Abstract1.t -> Lincons1.earray


(** Decompose an abstract value *)
external ap_disjunction__decompose : Manager.ap_manager_ptr -> Abstract0.ap_abstract0_ptr -> Abstract0.ap_abstract0_ptr array * int
	= "camlidl_disjunction_ap_disjunction__decompose"

val decompose : 'a t Manager.t -> 'a t Abstract0.t -> 'a Abstract0.t array
external ap_disjunction_compose : Manager.ap_manager_ptr -> Abstract0.ap_abstract0_ptr array -> Abstract0.ap_abstract0_ptr
	= "camlidl_disjunction_ap_disjunction_compose"


(** {2 Type conversions} *)

val manager_is_disjunction : 'a Manager.t -> bool
  (** Return [true] iff the argument manager is a disjunction manager *)
val manager_of_disjunction : 'a t Manager.t -> 'b Manager.t
  (** Make a disjunction manager generic *)
val manager_to_disjunction : 'a Manager.t -> 'b t Manager.t
  (** Instanciate the type of a disjunction manager.
      Raises [Failure] if the argument manager is not a disjunction manager *)
module Abstract0 : sig
  val is_disjunction : 'a Abstract0.t -> bool
    (** Return [true] iff the argument value is a disjunction value *)
  val of_disjunction : 'a t Abstract0.t -> 'b Abstract0.t
    (** Make a disjunction value generic *)
  val to_disjunction : 'a Abstract0.t -> 'b t Abstract0.t
    (** Instanciate the type of a disjunction value.
	Raises [Failure] if the argument value is not a disjunction value *)
end
module Abstract1 : sig
  val is_disjunction : 'a Abstract1.t -> bool
    (** Return [true] iff the argument value is a disjunction value *)
  val of_disjunction : 'a t Abstract1.t -> 'b Abstract1.t
    (** Make a disjunction value generic *)
  val to_disjunction : 'a Abstract1.t -> 'b t Abstract1.t
    (** Instanciate the type of a disjunction value.
	Raises [Failure] if the argument value is not a disjunction value *)
end

