(* File generated from box.idl *)


(** Intervals abstract domain *)

(** Type of boxes.

    Boxes constrains each dimension/variable [x_i] to belong to an interval
    [I_i].

    Abstract values which are boxes have the type [t Apron.AbstractX.t].

    Managers allocated for boxes have the type [t Apron.manager.t].
*)
type t

external manager_alloc : unit -> t Apron.Manager.t
	= "camlidl_box_box_manager_alloc"


let manager_is_box man =
  let str = Apron.Manager.get_library man in
  (String.compare str "box")==0
let manager_of_box (man:t Apron.Manager.t) : 'a Apron.Manager.t = Obj.magic man
let manager_to_box (man:'a Apron.Manager.t) : t Apron.Manager.t =
  if manager_is_box man then
    Obj.magic man
  else
    failwith "Box.manager_to_box: the argument manager is not a Box manager"
module Abstract0 = struct
  let is_box abs =
    manager_is_box (Apron.Abstract0.manager abs)
  let of_box (abs: t Apron.Abstract0.t) : 'a Apron.Abstract0.t = Obj.magic abs
  let to_box (abs:'a Apron.Abstract0.t) : t Apron.Abstract0.t =
  if is_box abs then
    Obj.magic abs
  else
    failwith "Box.Abstract0.to_box: the argument value is not a Box value"
end
module Abstract1 = struct
  let is_box abs =
    manager_is_box (Apron.Abstract1.manager abs)
  let of_box (abs: t Apron.Abstract1.t) : 'a Apron.Abstract1.t = Obj.magic abs
  let to_box (abs:'a Apron.Abstract1.t) : t Apron.Abstract1.t =
  if is_box abs then
    Obj.magic abs
  else
    failwith "Box.Abstract1.to_box: the argument value is not a Box value"
end
module Policy = struct
  let is_box p =
    let pman = Apron.Policy.manager p in
    let man = Apron.Policy.manager_get_manager pman in
    manager_is_box man
  let of_box (p: t Apron.Policy.t) : 'a Apron.Policy.t = Obj.magic p
  let to_box (p:'a Apron.Policy.t) : t Apron.Policy.t =
    if is_box p then
      Obj.magic p
    else
      failwith "Box.Policy.to_box: the argument value is not a Box value"
  let print string_of_dim fmt policy =
    let pman = Apron.Policy.manager policy in
    let str = Apron.Policy.to_string pman policy in
    let length = String.length str in
    let index = ref 0 in
    let policy = ref [] in
    while !index < length do
      let policy_one = ref [] in
      let dim = ref 0 in
      while str.[!index] <> '\n' do
	let inf = str.[!index] in incr index;
	let sup = str.[!index]; in incr index;
	incr index;
	policy_one := (!dim,inf,sup) :: !policy_one;
	incr dim;
      done;
      policy := (Array.of_list (List.rev !policy_one))::(!policy);
      incr index;
    done;
    let policy = Array.of_list (List.rev !policy) in
    Apron.Abstract0.print_array ~first:"[@[<v>" ~sep:"@ " ~last:"@]]"
      (Apron.Abstract0.print_array ~first:"[@[" ~sep:",@ " ~last:"@]]"
	(fun fmt (dim,inf,sup) ->
	  Format.fprintf fmt "%s:%c%c" (string_of_dim dim) inf sup))
      fmt policy

  let print0 fmt policy = print string_of_int fmt policy
  let print1 env fmt policy = print (fun dim -> let var = Apron.Environment.var_of_dim env dim in Apron.Var.to_string var) fmt policy
end

external policy_manager_alloc : t Apron.Manager.t -> t Apron.Policy.man
	= "camlidl_box_box_policy_manager_alloc"

