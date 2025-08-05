import {
  Box,
  Container,
  Heading,
  Text,
  Link,
  VStack,
  HStack,
  Icon,
  useColorModeValue,
} from '@chakra-ui/react'
import { ExternalLinkIcon } from '@chakra-ui/icons'

function App() {
  const bgColor = useColorModeValue('gray.50', 'gray.900')
  const cardBg = useColorModeValue('white', 'gray.800')

  return (
    <Box minH="100vh" bg={bgColor} py={8}>
      <Container maxW="container.md">
        <VStack spacing={8} align="stretch">
          <Box textAlign="center">
            <Heading size="2xl" color="blue.600" mb={4}>
              🍦 Flavor Town
            </Heading>
            <Text fontSize="lg" color="gray.600">
              Beautiful ice cream discovery platform
            </Text>
          </Box>

          <Box bg={cardBg} p={6} borderRadius="lg" boxShadow="md">
            <VStack spacing={4} align="stretch">
              <Heading size="md" color="gray.700">
                Welcome to Flavor Town!
              </Heading>
              <Text>
                This is a super basic React app built with Chakra UI. The backend API is running
                and provides a comprehensive Swagger documentation.
              </Text>
              
              <Box>
                <Text fontWeight="semibold" mb={2}>
                  API Documentation:
                </Text>
                <HStack>
                  <Link
                    href="http://localhost:8080/docs"
                    color="blue.500"
                    isExternal
                    display="flex"
                    alignItems="center"
                    gap={2}
                    _hover={{ color: 'blue.600', textDecoration: 'underline' }}
                  >
                    <Icon as={ExternalLinkIcon} />
                    View Swagger Documentation
                  </Link>
                </HStack>
              </Box>

              <Box>
                <Text fontWeight="semibold" mb={2}>
                  Available Endpoints:
                </Text>
                <VStack align="start" spacing={1}>
                  <Link href="http://localhost:8080/docs" color="blue.500" isExternal>
                    • Swagger UI
                  </Link>
                  <Link href="http://localhost:8080/swagger.json" color="blue.500" isExternal>
                    • Swagger JSON
                  </Link>
                  <Link href="http://localhost:8080/swagger.yaml" color="blue.500" isExternal>
                    • Swagger YAML
                  </Link>
                </VStack>
              </Box>
            </VStack>
          </Box>

          <Box bg={cardBg} p={6} borderRadius="lg" boxShadow="md">
            <VStack spacing={4} align="stretch">
              <Heading size="md" color="gray.700">
                Development Status
              </Heading>
              <Text>
                This is a basic setup. The backend API is running on port 8080 with PostgreSQL
                database. You can explore the API documentation to see available endpoints and
                start building your ice cream discovery features!
              </Text>
            </VStack>
          </Box>
        </VStack>
      </Container>
    </Box>
  )
}

export default App 