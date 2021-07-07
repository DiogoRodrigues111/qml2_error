#include "PlayerGenerator.h"

PlayerGenerator::PlayerGenerator() : QVariant()
{
    qRegisterMetaType<PlayerGenerator>();
}

PlayerGenerator::~PlayerGenerator()
{
}

float PlayerGenerator::setCoordinateId(float value) {
    return value;
}

float PlayerGenerator::getCoordinateId(float value) {
    return value;
}

float PlayerGenerator::CoordinateId(float value) {
    return value;
}

bool PlayerGenerator::getActivated(bool active) {
    return active;
}

bool PlayerGenerator::setActivated(bool active) {
    return active;
}

bool PlayerGenerator::isActivated(bool active) {
    return active;
}

int PlayerGenerator::setReturnTypeId(int value) {
    return value;
}

int PlayerGenerator::getReturnTypeId(int value) {
    return value;
}
