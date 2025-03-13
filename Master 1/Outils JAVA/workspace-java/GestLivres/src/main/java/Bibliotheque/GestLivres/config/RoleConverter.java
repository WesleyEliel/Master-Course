package Bibliotheque.GestLivres.config;

import Bibliotheque.GestLivres.Entities.Role;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class RoleConverter implements Converter<String, Role> {
    @Override
    public Role convert(String source) {
        return Role.fromString(source);
    }
}
