INCLUDEPATH += $$PWD

android {
    INCLUDEPATH += $$PWD/include/external/android 

    LIBS += -L$$PWD/wallet/android/$$ANDROID_TARGET_ARCH/
    LIBS += -L$$PWD/boost/lib/android/$$ANDROID_TARGET_ARCH/
    LIBS += -L$$PWD/openssl/lib/android/$$ANDROID_TARGET_ARCH/

    # XXX: order matters (utils first), wont link otherwise (undefined reference to cn_clow_hash, chacha8)
    LIBS += -lwallet_merged -leasylogging -lepee -lunbound -llmdb -lssl -lcrypto -lsodium
    # boost
    LIBS += -lboost_filesystem \
            -lboost_program_options \
            -lboost_regex \
            -lboost_serialization \
            -lboost_system \
            -lboost_thread \
	    -lboost_chrono
	    
} else {
    linux {
    LIBS += -L$$PWD/wallet/linux
    LIBS += -lwallet_merged -leasylogging -lepee -lunbound -llmdb -lssl -lcrypto -lsodium
    LIBS += -lboost_filesystem \
            -lboost_program_options \
            -lboost_regex \
            -lboost_serialization \
            -lboost_system \
            -lboost_thread
    }
}

ios {
LIBS += -L$$PWD/wallet/ios -lwallet_merged -lunbound -lepee -leasylogging
LIBS += -L$$PWD/openssl/lib/ios -lcrypto -lssl
LIBS += -L$$PWD/boost/lib/ios -lboost
} else {
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
