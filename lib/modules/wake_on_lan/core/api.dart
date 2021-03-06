import 'package:lunasea/core.dart';
import 'package:wake_on_lan/wake_on_lan.dart';

class WakeOnLANAPI {
    final Map<String, dynamic> _values;

    WakeOnLANAPI._internal(this._values);
    factory WakeOnLANAPI.from(ProfileHiveObject profile) => WakeOnLANAPI._internal(profile.getWakeOnLAN());
    
    void logError(String text, Object error, StackTrace trace) => LunaLogger().error('Wake on LAN: $text', error, trace);

    bool get enabled => _values['enabled'];
    String get broadcastAddress => _values['broadcastAddress'];
    String get macAddress => _values['MACAddress'];

    Future<bool> testConnection() async => true;

    Future<bool> wake() async {
        try {
            IPv4Address ipv4 = IPv4Address.from(broadcastAddress);
            MACAddress mac = MACAddress.from(macAddress);
            await WakeOnLAN.from(ipv4, mac).wake();
            return true;
        } catch (error, stack) {
            logError('Failed to wake machine', error, stack);
            return  Future.error(error);
        }
    }
}
