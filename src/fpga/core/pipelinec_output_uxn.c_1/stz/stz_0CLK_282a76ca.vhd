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
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 40
entity stz_0CLK_282a76ca is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_282a76ca;
architecture arch of stz_0CLK_282a76ca is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1493_c6_c8de]
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1493_c2_2c5d]
signal n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1493_c2_2c5d]
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1493_c2_2c5d]
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c2_2c5d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c2_2c5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c2_2c5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1493_c2_2c5d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1493_c2_2c5d]
signal t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_2add]
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1500_c7_faa3]
signal n8_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1500_c7_faa3]
signal result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1500_c7_faa3]
signal result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1500_c7_faa3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_faa3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1500_c7_faa3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1500_c7_faa3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1500_c7_faa3]
signal t8_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1503_c11_26ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1503_c7_b510]
signal n8_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1503_c7_b510]
signal result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1503_c7_b510]
signal result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1503_c7_b510]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1503_c7_b510]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1503_c7_b510]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1503_c7_b510]
signal t8_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_4454]
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1506_c7_ed04]
signal n8_MUX_uxn_opcodes_h_l1506_c7_ed04_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1506_c7_ed04]
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1506_c7_ed04]
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_ed04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1506_c7_ed04]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1506_c7_ed04]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1509_c30_4266]
signal sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1514_c11_9dbe]
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1514_c7_6baa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1514_c7_6baa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1514_c7_6baa]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_ram_write := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de
BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_left,
BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_right,
BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output);

-- n8_MUX_uxn_opcodes_h_l1493_c2_2c5d
n8_MUX_uxn_opcodes_h_l1493_c2_2c5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond,
n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue,
n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse,
n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output);

-- t8_MUX_uxn_opcodes_h_l1493_c2_2c5d
t8_MUX_uxn_opcodes_h_l1493_c2_2c5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond,
t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue,
t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse,
t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_left,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_right,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output);

-- n8_MUX_uxn_opcodes_h_l1500_c7_faa3
n8_MUX_uxn_opcodes_h_l1500_c7_faa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1500_c7_faa3_cond,
n8_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue,
n8_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse,
n8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3
result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3
result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output);

-- t8_MUX_uxn_opcodes_h_l1500_c7_faa3
t8_MUX_uxn_opcodes_h_l1500_c7_faa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1500_c7_faa3_cond,
t8_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue,
t8_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse,
t8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output);

-- n8_MUX_uxn_opcodes_h_l1503_c7_b510
n8_MUX_uxn_opcodes_h_l1503_c7_b510 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1503_c7_b510_cond,
n8_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue,
n8_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse,
n8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510
result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_cond,
result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510
result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_cond,
result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_return_output);

-- t8_MUX_uxn_opcodes_h_l1503_c7_b510
t8_MUX_uxn_opcodes_h_l1503_c7_b510 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1503_c7_b510_cond,
t8_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue,
t8_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse,
t8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_left,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_right,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_return_output);

-- n8_MUX_uxn_opcodes_h_l1506_c7_ed04
n8_MUX_uxn_opcodes_h_l1506_c7_ed04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1506_c7_ed04_cond,
n8_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue,
n8_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse,
n8_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_cond,
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_cond,
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04
result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1509_c30_4266
sp_relative_shift_uxn_opcodes_h_l1509_c30_4266 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_ins,
sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_x,
sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_y,
sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_left,
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_right,
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa
result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output,
 n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
 t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output,
 n8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output,
 t8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output,
 n8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_return_output,
 t8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_return_output,
 n8_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output,
 sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1497_c3_3651 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_0426 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_c7_faa3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1500_c7_faa3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1503_c7_b510_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1506_c7_ed04_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1511_c22_270f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1515_c3_62d3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_ffcd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_d420_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_d6ef_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_90de_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1506_DUPLICATE_1c02_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1520_l1489_DUPLICATE_68f2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1515_c3_62d3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1515_c3_62d3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1497_c3_3651 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1497_c3_3651;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_0426 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1501_c3_0426;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1506_DUPLICATE_1c02 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1506_DUPLICATE_1c02_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_90de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_90de_return_output := result.is_ram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_d6ef LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_d6ef_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l1509_c30_4266] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_ins;
     sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_x;
     sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_return_output := sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_2add] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_left;
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output := BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_ffcd LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_ffcd_return_output := result.u16_value;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1511_c22_270f] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1511_c22_270f_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_d420 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_d420_return_output := result.u8_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1500_c7_faa3] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_c7_faa3_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_4454] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_left;
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_return_output := BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1493_c6_c8de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1514_c11_9dbe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1503_c11_26ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_c8de_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1500_c7_faa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1500_c7_faa3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_2add_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1503_c7_b510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1503_c7_b510_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1503_c11_26ef_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1506_c7_ed04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_4454_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9dbe_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1511_c22_270f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_d6ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_d6ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_d6ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_d6ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_ffcd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_ffcd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_ffcd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_ffcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1506_DUPLICATE_1c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1506_DUPLICATE_1c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1506_DUPLICATE_1c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1506_DUPLICATE_1c02_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_90de_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_90de_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_90de_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1500_l1514_l1503_l1493_DUPLICATE_90de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_d420_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_d420_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_d420_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1500_l1503_l1493_l1506_DUPLICATE_d420_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1500_c7_faa3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1509_c30_4266_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1514_c7_6baa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1514_c7_6baa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output;

     -- t8_MUX[uxn_opcodes_h_l1503_c7_b510] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1503_c7_b510_cond <= VAR_t8_MUX_uxn_opcodes_h_l1503_c7_b510_cond;
     t8_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue;
     t8_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output := t8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1506_c7_ed04] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output := result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1514_c7_6baa] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output;

     -- n8_MUX[uxn_opcodes_h_l1506_c7_ed04] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1506_c7_ed04_cond <= VAR_n8_MUX_uxn_opcodes_h_l1506_c7_ed04_cond;
     n8_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue;
     n8_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output := n8_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1506_c7_ed04] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output := result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1500_c7_faa3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6baa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1506_c7_ed04] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_ed04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output;

     -- n8_MUX[uxn_opcodes_h_l1503_c7_b510] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1503_c7_b510_cond <= VAR_n8_MUX_uxn_opcodes_h_l1503_c7_b510_cond;
     n8_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue;
     n8_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output := n8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;

     -- t8_MUX[uxn_opcodes_h_l1500_c7_faa3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1500_c7_faa3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1500_c7_faa3_cond;
     t8_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue;
     t8_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output := t8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c2_2c5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1506_c7_ed04] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1503_c7_b510] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output := result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1503_c7_b510] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output := result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_ed04_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1503_c7_b510] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;

     -- t8_MUX[uxn_opcodes_h_l1493_c2_2c5d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond;
     t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue;
     t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output := t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1500_c7_faa3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1503_c7_b510] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1500_c7_faa3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;

     -- n8_MUX[uxn_opcodes_h_l1500_c7_faa3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1500_c7_faa3_cond <= VAR_n8_MUX_uxn_opcodes_h_l1500_c7_faa3_cond;
     n8_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue;
     n8_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output := n8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1503_c7_b510] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1503_c7_b510_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output;
     -- n8_MUX[uxn_opcodes_h_l1493_c2_2c5d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond;
     n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue;
     n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output := n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1500_c7_faa3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1493_c2_2c5d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1500_c7_faa3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_faa3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1493_c2_2c5d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1500_c7_faa3_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1493_c2_2c5d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c2_2c5d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c2_2c5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output;

     -- Submodule level 6
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1520_l1489_DUPLICATE_68f2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1520_l1489_DUPLICATE_68f2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2c5d_return_output);

     -- Submodule level 7
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1520_l1489_DUPLICATE_68f2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1520_l1489_DUPLICATE_68f2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
