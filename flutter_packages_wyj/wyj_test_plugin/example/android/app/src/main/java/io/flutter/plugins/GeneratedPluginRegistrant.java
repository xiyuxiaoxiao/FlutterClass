package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.wyj.wyj_test_plugin.WyjTestPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    WyjTestPlugin.registerWith(registry.registrarFor("com.wyj.wyj_test_plugin.WyjTestPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
