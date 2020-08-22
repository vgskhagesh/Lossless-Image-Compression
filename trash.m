

m = length(symbol);
dictionary = [];
cache = [];
for i=1:m
    dictionary = [dictionary;[{symbol(i)},{[]}]];
    cache = [cache;[{[symbol(i)]}]];
end

P = [];
S = [];
for i=1:m
    P = [P {p(i)}];
    S = [S {symbol(i)}];
end


%map = containers.Map(num2cell(p'),num2cell(symbol'));
map = containers.Map(p,linspace(1,m,m));
k=keys(map);
val=values(map);

% for i=1:length(map)
%     disp([k{i},val{i}]);
%     fprintf('\n');
% end

index_map = zeros(256,1);
for i=1:length(symbol)
    index_map(symbol(i)) = i;
end

count = 0;
while(length(map))>1
    break;
    count = count+1;
    k = keys(map);
    val = values(map);
    dict_one = cache{val{1}};
    dict_two = cache{val{2}};
    for i=1:length(cache{val{1}})
        dictionary{index_map(dict_one(i)),2} = [dictionary{index_map(dict_one(i)),2} 1];
    end
    for i=1:length(cache{val{1}})
        dictionary{index_map(dict_two(i)),2} = [dictionary{index_map(dict_two(i)),2} 0];
    end
    %map(val{2}) = [map(val{2}) map(val{1})];
    cache{val{2}} = {cache{val{2}} cache{val{1}}};
    map(k{1}+k{2}) = val{2};
    remove(map,k{1});
    remove(map,k{2});
    break;
end




