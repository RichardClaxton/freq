%%
%% This code is as seen and can be used and distributed freely
%% Richard Claxton 5 - Nov - 2012
%%

-module(f).
-export([run/1,mapper/2]).

run(FileToLoad) ->
	FullBook = loadFile(FileToLoad),
	TokenList = (string:tokens(FullBook," \r\n,.-")),
	Mapper = fun(X,Acc) -> f:mapper(X,Acc) end,
	WC = lists:foldl(Mapper,[],TokenList),
	file:write_file("./output.txt", io_lib:fwrite("~p.\n", [WC])),
	io:format("Done").

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
