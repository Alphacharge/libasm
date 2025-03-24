#include <stdio.h>

extern size_t	ft_strlen(const char *str);

int main() {
	const char	*text = "Hello, world!";
	size_t		len;

	len = ft_strlen(text);
	printf("Length of string: %zu\n", len);
	return (0);
}
