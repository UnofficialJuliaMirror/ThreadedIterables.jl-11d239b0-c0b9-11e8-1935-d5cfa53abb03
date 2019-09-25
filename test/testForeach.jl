function testTforeach()::Bool
	arr = randArray();
	serial = 0;
	parallel = Threads.Atomic{Int}(0);
	foreach(x->serial+=x, arr);
	tforeach(x->Threads.atomic_add!(parallel, x), arr);
	return serial == parallel[];
end

function testTforeachMultiple()::Bool
	arr1 = randArray();
	arr2 = randArray();
	serial1 = 0;
	serial2 = 0;
	parallel1 = Threads.Atomic{Int}(0);
	parallel2 = Threads.Atomic{Int}(0);
	foreach((x, y)->begin serial1 += x; serial2 += y; end, arr1, arr2);
	foreach((x, y)->begin Threads.atomic_add!(parallel1, x); Threads.atomic_add!(parallel2, y); end, arr1, arr2);
	return serial1 == parallel1[];
	return serial2 == parallel2[];
end