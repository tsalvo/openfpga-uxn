-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 80
entity ldr2_0CLK_188cbc69 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_188cbc69;
architecture arch of ldr2_0CLK_188cbc69 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1729_c6_99fc]
signal BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1729_c2_497b]
signal tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1729_c2_497b]
signal t8_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1729_c2_497b]
signal result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1729_c2_497b]
signal result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1729_c2_497b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1729_c2_497b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1729_c2_497b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1729_c2_497b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1729_c2_497b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_53d4]
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1734_c7_9cbe]
signal tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1734_c7_9cbe]
signal t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_9cbe]
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_9cbe]
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_9cbe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1734_c7_9cbe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_9cbe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_9cbe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1734_c7_9cbe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1737_c11_76b4]
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1737_c7_1886]
signal tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1737_c7_1886]
signal t8_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1737_c7_1886]
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1737_c7_1886]
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1737_c7_1886]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1737_c7_1886]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1737_c7_1886]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1737_c7_1886]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1737_c7_1886]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1740_c30_7874]
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_return_output : signed(3 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1741_c22_8547]
signal BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1743_c11_92f5]
signal BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1743_c7_92c0]
signal tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1743_c7_92c0]
signal result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1743_c7_92c0]
signal result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1743_c7_92c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1743_c7_92c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1743_c7_92c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1743_c7_92c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1747_c11_7ca4]
signal BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1747_c7_a306]
signal tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1747_c7_a306]
signal result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1747_c7_a306]
signal result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1747_c7_a306]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1747_c7_a306]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1747_c7_a306]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1749_c3_ab6e]
signal CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1750_c22_aca8]
signal BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1752_c11_1b83]
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1752_c7_05e0]
signal tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1752_c7_05e0]
signal result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1752_c7_05e0]
signal result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1752_c7_05e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1752_c7_05e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1752_c7_05e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1753_c22_6ed1]
signal BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1755_c11_ed1e]
signal BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1755_c7_18a4]
signal tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1755_c7_18a4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1755_c7_18a4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1755_c7_18a4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1755_c7_18a4]
signal result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1756_c3_8974]
signal BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1761_c11_d18f]
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1761_c7_7e36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1761_c7_7e36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c7_7e36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1761_c7_7e36]
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1763_c31_77a8]
signal CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1765_c11_14f5]
signal BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1765_c7_0503]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1765_c7_0503]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_sp_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc
BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_left,
BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_right,
BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1729_c2_497b
tmp16_MUX_uxn_opcodes_h_l1729_c2_497b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_cond,
tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue,
tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse,
tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_return_output);

-- t8_MUX_uxn_opcodes_h_l1729_c2_497b
t8_MUX_uxn_opcodes_h_l1729_c2_497b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1729_c2_497b_cond,
t8_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue,
t8_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse,
t8_MUX_uxn_opcodes_h_l1729_c2_497b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b
result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b
result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_left,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_right,
BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe
tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond,
tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue,
tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse,
tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output);

-- t8_MUX_uxn_opcodes_h_l1734_c7_9cbe
t8_MUX_uxn_opcodes_h_l1734_c7_9cbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond,
t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue,
t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse,
t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_left,
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_right,
BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1737_c7_1886
tmp16_MUX_uxn_opcodes_h_l1737_c7_1886 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_cond,
tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue,
tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse,
tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_return_output);

-- t8_MUX_uxn_opcodes_h_l1737_c7_1886
t8_MUX_uxn_opcodes_h_l1737_c7_1886 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1737_c7_1886_cond,
t8_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue,
t8_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse,
t8_MUX_uxn_opcodes_h_l1737_c7_1886_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_cond,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_cond,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886
result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886
result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1740_c30_7874
sp_relative_shift_uxn_opcodes_h_l1740_c30_7874 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_ins,
sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_x,
sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_y,
sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547
BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_left,
BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_right,
BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5
BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_left,
BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_right,
BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0
tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_cond,
tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0
result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0
result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0
result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0
result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0
result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_left,
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_right,
BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1747_c7_a306
tmp16_MUX_uxn_opcodes_h_l1747_c7_a306 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_cond,
tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue,
tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse,
tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306
result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_cond,
result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306
result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_cond,
result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306
result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e
CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_x,
CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8
BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_left,
BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_right,
BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_left,
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_right,
BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0
tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_cond,
tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0
result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1
BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_left,
BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_right,
BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e
BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_left,
BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_right,
BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4
tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_cond,
tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4
result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974
BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_left,
BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_right,
BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f
BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_left,
BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_right,
BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36
result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_cond,
result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8
CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_x,
CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5
BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_left,
BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_right,
BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
 t8_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output,
 t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_return_output,
 t8_MUX_uxn_opcodes_h_l1737_c7_1886_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output,
 sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_return_output,
 CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_return_output,
 tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output,
 CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_d479 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_e00b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1741_c3_aa26 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1741_c27_1f16_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1745_c3_ff80 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1750_c3_0979 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1753_c3_c268 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1758_c3_369c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1759_c21_c39c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1762_c3_3978 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1763_c21_6cd3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1729_l1734_l1752_DUPLICATE_b7a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1734_l1729_l1752_DUPLICATE_d660_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1729_l1752_DUPLICATE_bd07_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1729_l1734_l1737_DUPLICATE_d9c7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1729_l1743_l1734_DUPLICATE_d4eb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1755_l1752_DUPLICATE_84af_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1752_DUPLICATE_c3d9_return_output : unsigned(3 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1750_l1753_l1745_DUPLICATE_2235_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_return_output : signed(17 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1756_l1748_DUPLICATE_8908_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1770_l1724_DUPLICATE_5609_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_d479 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_d479;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1762_c3_3978 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1762_c3_3978;
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1758_c3_369c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1758_c3_369c;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_e00b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1735_c3_e00b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_right := to_unsigned(7, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_right := to_unsigned(4, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_right := to_unsigned(5, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1737_c11_76b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1741_c27_1f16] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1741_c27_1f16_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- sp_relative_shift[uxn_opcodes_h_l1740_c30_7874] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_ins;
     sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_x;
     sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_return_output := sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1729_l1743_l1734_DUPLICATE_d4eb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1729_l1743_l1734_DUPLICATE_d4eb_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1752_DUPLICATE_c3d9 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1752_DUPLICATE_c3d9_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1755_l1752_DUPLICATE_84af LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1755_l1752_DUPLICATE_84af_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1752_c11_1b83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_left;
     BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_return_output := BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1765_c11_14f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1750_l1753_l1745_DUPLICATE_2235 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1750_l1753_l1745_DUPLICATE_2235_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1729_l1734_l1752_DUPLICATE_b7a9 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1729_l1734_l1752_DUPLICATE_b7a9_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1729_c6_99fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1755_c11_ed1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1734_c11_53d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1729_l1734_l1737_DUPLICATE_d9c7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1729_l1734_l1737_DUPLICATE_d9c7_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1729_l1752_DUPLICATE_bd07 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1729_l1752_DUPLICATE_bd07_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1734_l1729_l1752_DUPLICATE_d660 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1734_l1729_l1752_DUPLICATE_d660_return_output := result.u8_value;

     -- CONST_SR_8[uxn_opcodes_h_l1763_c31_77a8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_return_output := CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1747_c11_7ca4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1743_c11_92f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1761_c11_d18f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1756_l1748_DUPLICATE_8908 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1756_l1748_DUPLICATE_8908_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1729_c2_497b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c6_99fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1734_c11_53d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1737_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1737_c11_76b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1743_c11_92f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1747_c11_7ca4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1752_c11_1b83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1755_c11_ed1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1761_c11_d18f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_14f5_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1741_c27_1f16_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1750_l1753_l1745_DUPLICATE_2235_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1756_l1748_DUPLICATE_8908_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1756_l1748_DUPLICATE_8908_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1729_l1734_l1737_DUPLICATE_d9c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1729_l1734_l1737_DUPLICATE_d9c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1729_l1734_l1737_DUPLICATE_d9c7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1729_l1734_l1752_DUPLICATE_b7a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1729_l1734_l1752_DUPLICATE_b7a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1729_l1734_l1752_DUPLICATE_b7a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1755_l1752_DUPLICATE_84af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1755_l1752_DUPLICATE_84af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1755_l1752_DUPLICATE_84af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1755_l1752_DUPLICATE_84af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1755_l1752_DUPLICATE_84af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1755_l1752_DUPLICATE_84af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1755_l1752_DUPLICATE_84af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1755_l1752_DUPLICATE_84af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1729_l1743_l1734_DUPLICATE_d4eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1729_l1743_l1734_DUPLICATE_d4eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1729_l1743_l1734_DUPLICATE_d4eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1729_l1752_DUPLICATE_bd07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1729_l1752_DUPLICATE_bd07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1729_l1752_DUPLICATE_bd07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1729_l1752_DUPLICATE_bd07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1729_l1752_DUPLICATE_bd07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1729_l1752_DUPLICATE_bd07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1729_l1752_DUPLICATE_bd07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1747_l1743_l1765_l1737_l1761_l1734_l1729_l1752_DUPLICATE_bd07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1752_DUPLICATE_c3d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1752_DUPLICATE_c3d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1752_DUPLICATE_c3d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1752_DUPLICATE_c3d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1752_DUPLICATE_c3d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1734_l1729_l1752_DUPLICATE_d660_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1734_l1729_l1752_DUPLICATE_d660_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1734_l1729_l1752_DUPLICATE_d660_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1734_l1729_l1752_DUPLICATE_d660_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1734_l1729_l1752_DUPLICATE_d660_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1734_l1729_l1752_DUPLICATE_d660_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1747_l1743_l1737_l1761_l1734_l1729_l1752_DUPLICATE_d660_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1740_c30_7874_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1765_c7_0503] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1743_c7_92c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1763_c21_6cd3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1763_c21_6cd3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1763_c31_77a8_return_output);

     -- BIN_OP_PLUS[uxn_opcodes_h_l1741_c22_8547] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1749_c3_ab6e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_return_output := CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1765_c7_0503] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1761_c7_7e36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1737_c7_1886] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1756_c3_8974] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_left;
     BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_return_output := BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_return_output;

     -- t8_MUX[uxn_opcodes_h_l1737_c7_1886] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1737_c7_1886_cond <= VAR_t8_MUX_uxn_opcodes_h_l1737_c7_1886_cond;
     t8_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue;
     t8_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1737_c7_1886_return_output := t8_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1741_c3_aa26 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1741_c22_8547_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1745_c3_ff80 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1753_l1750_l1745_DUPLICATE_9b6c_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1763_c21_6cd3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1749_c3_ab6e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_0503_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1765_c7_0503_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1741_c3_aa26;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1745_c3_ff80;
     -- t8_MUX[uxn_opcodes_h_l1734_c7_9cbe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond;
     t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue;
     t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output := t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1755_c7_18a4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_cond;
     tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output := tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1737_c7_1886] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1761_c7_7e36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1734_c7_9cbe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1761_c7_7e36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1753_c22_6ed1] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1755_c7_18a4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1750_c22_aca8] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1759_c21_c39c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1759_c21_c39c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1756_c3_8974_return_output);

     -- result_u8_value_MUX[uxn_opcodes_h_l1761_c7_7e36] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output := result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1750_c3_0979 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1750_c22_aca8_return_output)),16);
     VAR_result_u16_value_uxn_opcodes_h_l1753_c3_c268 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1753_c22_6ed1_return_output)),16);
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1759_c21_c39c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1761_c7_7e36_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1750_c3_0979;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1753_c3_c268;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1729_c2_497b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1752_c7_05e0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_cond;
     tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output := tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1755_c7_18a4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1755_c7_18a4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1734_c7_9cbe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;

     -- t8_MUX[uxn_opcodes_h_l1729_c2_497b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1729_c2_497b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1729_c2_497b_cond;
     t8_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue;
     t8_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1729_c2_497b_return_output := t8_MUX_uxn_opcodes_h_l1729_c2_497b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1755_c7_18a4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1752_c7_05e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1752_c7_05e0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1755_c7_18a4_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1729_c2_497b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1729_c2_497b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1747_c7_a306] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output := result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1752_c7_05e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1747_c7_a306] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1752_c7_05e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1747_c7_a306] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_cond;
     tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_return_output := tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1752_c7_05e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1747_c7_a306_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1752_c7_05e0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1747_c7_a306_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1743_c7_92c0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1747_c7_a306] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output := result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1743_c7_92c0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_cond;
     tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output := tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1747_c7_a306] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1743_c7_92c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1747_c7_a306] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1747_c7_a306_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1747_c7_a306_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1747_c7_a306_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1737_c7_1886] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output := result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1737_c7_1886] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_cond;
     tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_return_output := tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1743_c7_92c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1743_c7_92c0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1743_c7_92c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1737_c7_1886] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1743_c7_92c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1734_c7_9cbe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1737_c7_1886] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output := result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1734_c7_9cbe] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond;
     tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output := tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1734_c7_9cbe] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output := result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1737_c7_1886] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1737_c7_1886] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1737_c7_1886_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1734_c7_9cbe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1734_c7_9cbe] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output := result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1734_c7_9cbe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1729_c2_497b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_cond;
     tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_return_output := tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1729_c2_497b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1729_c2_497b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1734_c7_9cbe_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1729_c2_497b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1729_c2_497b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1729_c2_497b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1729_c2_497b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1770_l1724_DUPLICATE_5609 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1770_l1724_DUPLICATE_5609_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c2_497b_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1770_l1724_DUPLICATE_5609_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_9dc9_uxn_opcodes_h_l1770_l1724_DUPLICATE_5609_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
