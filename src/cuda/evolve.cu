/*
 * evaluate.cu
 *
 *  Created on: 20/03/2015
 *      Author: Fernando B Oliveira - fboliveira25@gmail.com
 *
 *  Description:
 *	
 */

#include <vector>
#include "../classes/Random.hpp"

using namespace std;

__global__ void mutateIndividual(int *genes, int *keys, int *res) {

}

void evolve(Individual& ind) {

	std::vector<int> key;
	Random::randPermutation(ind.getNumCustomers(), 0, key);

}
