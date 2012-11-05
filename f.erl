-module(f).
-export([run/0,mapper/2]).

run() ->
	FullBook = loadFile("r.txt"),
	TokenList = (string:tokens(FullBook," \r\n")),
	Mapper = fun(X,Acc) -> f:mapper(X,Acc) end,
	WC = lists:foldl(Mapper,[],TokenList),
	io:format("Word Count -> ~p~n",[WC]).

loadFile(FileName) ->
	io:format("Loading... ~n"),
	{ok,Data} =file:read_file(FileName),
	binary_to_list(Data).

mapper(S,Acc) ->
	Match = lists:keyfind(S,1,Acc),
	Ret = case Match of
		{Key,Count} -> 
			NewCount = Count + 1,
			lists:keyreplace(Key,1,Acc,{Key,NewCount});
		false -> 
			[{S,1} | Acc]
		end,
	Ret.
