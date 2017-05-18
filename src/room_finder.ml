
exception IO_ERROR of string

(* let string_of_uri uri =
    try let connection = Curl.init () and write_buff = Buffer.create 1763 in
        Curl.set_writefunction connection
                (fun x -> Buffer.add_string write_buff x; String.length x);
        Curl.set_url connection uri;
        Curl.perform connection;
        Curl.global_cleanup ();
        Buffer.contents write_buff;
    with _ -> raise (IO_ERROR uri)
;;

let test_string = "\"hi\"+\"there\"";;
Py.set_python_home "/usr/local/bin/python3.5/";;
Py.initialize ~interpreter:"/usr/bin/python3.5" ~version:(3,5) ();; *)

(* let runned_py = Py.Run.eval test_string in
let bla = Py.Object.to_string runned_py in
print_string bla *)

(* let py_channel = open_in "src/rf.py" in
Py.Run.simple_file (Py.Channel py_channel) "rf.py" *)

(* let shit = (Py.Run.file (Py.Channel py_channel)) in
let more_shit = Py.Object.to_string shit in
print_string shit *)

let () =
  (* Just using pstree as an example, you can pick something else *)
  let ic = Unix.open_process_in "./src/rf.py" in
  let all_input = ref [] in
  try
    while true do
      all_input := input_line ic :: !all_input
    done
  with
    End_of_file ->
    (* Just an example, you can do something else here *)
    close_in ic;
    List.iter print_string !all_input
