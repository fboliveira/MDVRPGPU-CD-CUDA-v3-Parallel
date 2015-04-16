/*
 * ManagedRoute.h
 *
 *  Created on: Apr 16, 2015
 *      Author: Fernando B Oliveira - fboliveira25@gmail.com
 *
 *  Description:
 *	
 */

#ifndef MANAGEDROUTE_H_
#define MANAGEDROUTE_H_

#include "ManagedDoubleLinkedList.hpp"

class ManagedRoute {

    DoubleLinkedList *tour;

    float cost;
    float penaltyDuration;
    float penaltyDemand;

    int id;
    int depot;
    int demand;

public:

    ManagedRoute() {
    	tour->destroyList();
    }

};

#endif /* MANAGEDROUTE_H_ */
