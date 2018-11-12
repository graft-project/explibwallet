INCLUDEPATH += $$PWD

linux {
LIBS += -L$$PWD/wallet/linux -lwallet_merged -leasylogging -lepee -lunbound
LIBS += -lssl -lcrypto
LIBS += -lboost_filesystem \
        -lboost_program_options \
        -lboost_regex \
        -lboost_serialization \
        -lboost_system \
        -lboost_thread
}

ios {
LIBS += -L$$PWD/wallet/ios -lwallet_merged -lunbound -lepee -leasylogging
LIBS += -L$$PWD/openssl/lib/ios -lcrypto -lssl
LIBS += -L$$PWD/boost/lib/ios -lboost
}
else {
    mac {
    LIBS += -L$$PWD/wallet/mac -lwallet_merged -leasylogging -lepee -lunbound
    LIBS += -L$$PWD/openssl/lib/mac -lcrypto -lssl
    LIBS += -L$$PWD/boost/lib/mac \
            -lboost_system \
            -lboost_program_options \
            -lboost_filesystem \
            -lboost_serialization \
            -lboost_thread-mt \
            -lboost_regex
    }
}
