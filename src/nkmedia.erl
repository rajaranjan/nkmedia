%% -------------------------------------------------------------------
%%
%% Copyright (c) 2016 Carlos Gonzalez Florido.  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -------------------------------------------------------------------

%% @doc NkMEDIA application

-module(nkmedia).
-author('Carlos Gonzalez <carlosj.gf@gmail.com>').
-export([start_fs/0, start_fs/1, stop_fs/0, stop_fs/1]).
-export([nkdocker_event/2]).




%% ===================================================================
%% Types
%% ===================================================================


-type fs_start_opts() ::
	#{
		index => pos_integer(),
		version => binary(),
		release => binary(),
		password => binary(),
		docker_company => binary()
	}.




%% ===================================================================
%% Public functions
%% ===================================================================


%% @doc equivalent to start_fs(#{})
-spec start_fs() ->
	ok | {error, term()}.

start_fs() ->
	start_fs(#{}).


%% @doc Manually starts a local freeswitch
-spec start_fs(fs_start_opts()) ->
	ok | {error, term()}.

start_fs(Spec) ->
	nkmedia_fs:start(Spec).


%% @doc equivalent to stop_fs(#{})
-spec stop_fs() ->
	ok | {error, term()}.

stop_fs() ->
	stop_fs(#{}).


%% @doc Manually starts a local freeswitch
-spec stop_fs(fs_start_opts()) ->
	ok | {error, term()}.

stop_fs(Spec) ->
	nkmedia_fs:stop_fs(Spec).










%% ===================================================================
%% Private
%% ===================================================================


nkdocker_event(Id, Event) ->
	lager:warning("EVENT: ~p, ~p", [Id, Event]).