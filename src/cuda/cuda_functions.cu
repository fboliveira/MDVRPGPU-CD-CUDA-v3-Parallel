/*
 * cuda_functions.cpp
 *
 *  Created on: Mar 24, 2015
 *      Author: Fernando B Oliveira - fboliveira25@gmail.com
 *
 *  Description:
 *	
 */

#include "cuda_functions.h"

void cudaMutate(::vector<int>& genes) {

	std::vector<int> key;
	Random::randPermutation(genes.size(), 0, key);
	int s = genes.size();

	//Util::print(key);

	thrust::host_vector<int> h_res(s);
	thrust::device_vector<int> d_genes = genes;
	thrust::device_vector<int> d_keys = key;
	thrust::device_vector<int> d_res = genes;

	//dim3 threadsPerBlock(32, 32);
	//dim3 numBlocks(s / threadsPerBlock.x, s / threadsPerBlock.y);

	// Invoke kernel
	int threadsPerBlock = 32;
	int blocksPerGrid = (s + threadsPerBlock - 1) / threadsPerBlock;

	mutateIndividual<<<blocksPerGrid, threadsPerBlock>>>( convertToKernel(d_genes), convertToKernel(d_keys),
			convertToKernel(d_res) );

	genes.clear();

	// transfer data back to host
	thrust::copy(d_res.begin(), d_res.end(), h_res.begin());
	genes.assign(h_res.begin(), h_res.end());

	//Util::print(genes);

}



