%%
%% This code is as seen and can be used and distributed freely
%% Richard Claxton 5 - Nov - 2012
%%

-module(f).
-export([run/1,mapper/2,sorter/2]).

%%
run(FileToLoad) ->
	io:format("Loading... ~n"),
	FullBook = loadFile(FileToLoad),
	TokenList = (string:tokens(FullBook," \r\n,.-")),
	Mapper = fun(X,Acc) -> f:mapper(X,Acc) end,
	WC = lists:foldl(Mapper,[],TokenList),
	
	io:format("Sorting... ~n"),
	Sorter = fun(A,B) -> f:sorter(A,B) end,
	SortedWC = lists:sort(Sorter,WC),
	
	io:format("Writing... ~n"),
	file:write_file("./output.txt", io_lib:fwrite("~p.\n", [SortedWC])),
	io:format("Done. ~n").

%%
loadFile(FileName) ->
	{ok,Data} =file:read_file(FileName),
	binary_to_list(Data).

%%
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

%%
sorter(A,B) ->
	{_K1,V1} = A,
	{_K2,V2} = B,
	V1 > V2.

