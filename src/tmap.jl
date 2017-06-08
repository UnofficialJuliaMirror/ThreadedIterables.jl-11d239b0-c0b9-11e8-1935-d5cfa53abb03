export tmap, tmap!;

function tmap{T<:AbstractArray}(f::Function, c::T)
	ret = similar(c, Any);
	Threads.@threads for i in eachindex(c)
		ret[i] = f(c[i]);
	end
	return reshape([ret...],size(ret)...);
end

function tmap!{T<:AbstractArray}(f::Function, c::T)::Void # TODO: Handle type instability
	Threads.@threads for i in eachindex(c)
		c[i] = f(c[i]);
	end
end

function tmap!{T<:AbstractArray}(f::Function, d::T, c::T)::Void # TODO: Handle type instability
	Threads.@threads for i in eachindex(c)
		d[i] = f(c[i]);
	end
end
