function [ first_out, second_out ] = cross_over( first, second )

locus = randi([2,7]);

first.genotype(locus:7) = second.genotype(locus:7);
second.genotype(locus:7) = first.genotype(locus:7);

first_out = first;
second_out = second;
end

