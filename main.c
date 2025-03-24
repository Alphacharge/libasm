#include <stdio.h>

extern size_t	ft_strlen(const char *str);
extern char		*ft_strcpy(char *dest, const char *src);

int main() {
	const char	*src = "Hello, world!";
	size_t		len;

	len = ft_strlen(src);
	printf("Length of src is: %zu\n\n", len);

	char		dest[len];
	char		*check = NULL;

	printf("src is:>%s<, dest is: >%s<, check is: >%s<\ncopy it...\n", src, dest, check);
	check = ft_strcpy(dest, src);
	printf("src is:>%s<, dest is: >%s<, check is: >%s<\n", src, dest, check);

	return (0);
}
